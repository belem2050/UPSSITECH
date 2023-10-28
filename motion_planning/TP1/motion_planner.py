class MotionPlanner:
  def __init__ (self, robot, ps):
    self.robot = robot
    self.ps = ps

  def solveBiRRT (self, maxIter = float("inf")):
    self.ps.prepareSolveStepByStep()
    finished = False

    
    nbCC = self.ps.numberConnectedComponents()
    if nbCC != 2:
      raise Exception("There should be 2 connected components.")

    iter = 0
    while True:
    
      #### RRT begin
      newConfigs = list()
	  # We have 2 connected components
      for configIndice in range(2):
        # random  robot configuration
        qrand = self.robot.shootRandomConfig()
                
        # nearest configuration 
        qNearest, distance = self.ps.getNearestConfig(qrand)
                

        #creation of path between qNearest and qrand
        valid, pathId, _ = self.ps.directPath(qNearest, qrand, True)
        qNew = self.ps.configAtParam(pathId, self.ps.pathLength(pathId))
                
        #path adding to roadmap after created
        self.ps.addConfigToRoadmap(qNew)
        self.ps.addEdgeToRoadmap(qNearest, qNew, pathId, True)
        newConfigs.append(qNew)

      ## nodes connection
        for configIndice in range(len(newConfigs)):

            if newConfigs[configIndice] != qNew: # if equal nothing is needed to be done
                valid, pathId, _ = self.ps.directPath(newConfigs[configIndice], qNew, True)
                if valid:
                    self.ps.addEdgeToRoadmap(newConfigs[configIndice], qNew, pathId, True)
            
        
      #### RRT end
      
      ## Check if the problem is solved.
      nbCC = self.ps.numberConnectedComponents()
      if nbCC == 1:
        # Problem solved
        finished = True
        break
      iter = iter + 1
      if iter > maxIter:
        break
    if finished:
        self.ps.finishSolveStepByStep()
        return self.ps.numberPaths() - 1
