from math import sqrt
from hpp import Transform
from hpp.corbaserver.manipulation import ConstraintGraph,Constraints
from hpp.corbaserver import Client
Client ().problem.resetProblem ()
from manipulation import robot, vf, ps, Ground, Box, Pokeball, PathPlayer, gripperName, ballName



vf.loadEnvironmentModel (Ground, 'ground')
vf.loadEnvironmentModel (Box, 'box')
vf.moveObstacle ('box/base_link_0', [0.3+0.04, 0, 0.04, 0, 0, 0, 1])
vf.moveObstacle ('box/base_link_1', [0.3-0.04, 0, 0.04, 0, 0, 0, 1])
vf.moveObstacle ('box/base_link_2', [0.3, 0.04, 0.04, 0, 0, 0, 1])
vf.moveObstacle ('box/base_link_3', [0.3, -0.04, 0.04, 0, 0, 0, 1])

vf.loadObjectModel (Pokeball, 'pokeball')
robot.setJointBounds ('pokeball/root_joint', [-.4,.4,-.4,.4,-.1,1.,
                                              -1.0001, 1.0001,-1.0001, 1.0001,
                                              -1.0001, 1.0001,-1.0001, 1.0001,])

q1 = [0, -1.57, 1.57, 0, 0, 0, .3, 0, 0.025, 0, 0, 0, 1]

## Create graph
graph = ConstraintGraph (robot, 'graph')

#Nodes creations
nodes = ['grasp-placement', 'ball-above-ground', 'gripper-above-ball', 'grasp', 'placement']
graph.createNode (nodes)

graph.createEdge ('placement', 'placement', 'transit', 1, 'placement')
graph.createEdge ('grasp', 'grasp', 'transfer', 1, 'grasp')
graph.createEdge ('grasp-placement', 'gripper-above-ball', 'move-gripper-up', 1, 'placement')
graph.createEdge ('grasp-placement', 'ball-above-ground', 'take-ball-up', 1, 'grasp')
graph.createEdge ('gripper-above-ball', 'grasp-placement', 'grasp-ball', 1, 'placement')
graph.createEdge ('gripper-above-ball', 'placement', 'move-gripper-away',1, 'placement')
graph.createEdge ('ball-above-ground', 'grasp-placement', 'put-ball-down', 1, 'grasp')
graph.createEdge ('ball-above-ground', 'grasp', 'take-ball-away', 1, 'grasp')
graph.createEdge ('grasp', 'ball-above-ground', 'approach-ground', 1, 'grasp')
graph.createEdge ('placement', 'gripper-above-ball', 'approach-ball', 1, 'placement')



# complement constraint creation

ps.createTransformationConstraint (
    'grasp', 
    gripperName, ballName, [0, .137, 0, 0.5, 0.5, -0.5, 0.5], 
    [True,  True,  True,  True,  True,  True, ]
    )
ps.createTransformationConstraint ('placement/complement',
 '', ballName, 
 [0, 0, 0.025, 0, 0, 0, 1], 
 [True,  True,  False, False, False, True, ]
 )
ps.createTransformationConstraint ('approachStart', 
gripperName, ballName, 
[0, .25, 0, 0.5, 0.5, -0.5, 0.5], 
[True,  True,  True,  True,  True,  True, ]
)
ps.createTransformationConstraint ('approachEnd',
 '', 
 ballName, 
 [0, 0, 0.3, 0, 0, 0, 1], 
 [False, False, True,  True,  True,  False,]
 )
ps.createTransformationConstraint ('placement',
 '', 
 ballName, 
 [0, 0, 0.025, 0, 0, 0, 1], 
 [False, False, True,  True,  True,  False,]
 )

#RightHandSide constant
ps.setConstantRightHandSide ('placement', True)
ps.setConstantRightHandSide ('approachStart', True)
ps.setConstantRightHandSide ('approachEnd', True)
ps.setConstantRightHandSide ('placement/complement', False)


##constraints of nodes and edges
graph.addConstraints (node='placement',
                      constraints = Constraints (numConstraints = ['placement'],))
graph.addConstraints (node='gripper-above-ball', 
                      constraints = Constraints (numConstraints = ['placement', 'approachStart']))
graph.addConstraints (node='grasp-placement' , 
                      constraints = Constraints (numConstraints = ['grasp', 'placement']))
graph.addConstraints (node='ball-above-ground' , 
                      constraints = Constraints (numConstraints = ['grasp', 'approachEnd']))
graph.addConstraints (node='grasp' , 
                      constraints = Constraints (numConstraints = ['grasp']))

graph.addConstraints (edge='transit' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='approach-ball' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='move-gripper-away', 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='move-gripper-up' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='grasp-ball' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='take-ball-up' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))
graph.addConstraints (edge='put-ball-down' , 
                      constraints = Constraints (numConstraints = ['placement/complement']))

graph.addConstraints (edge='transfer', 
                      constraints = Constraints ())
graph.addConstraints (edge='take-ball-away', 
                      constraints = Constraints ())


ps.selectPathValidation ("Discretized", 0.01)
ps.selectPathProjector  ("Progressive", 0.1)
graph.initialize ()

res, q_init, error = graph.applyNodeConstraints ('placement', q1)
q2 = q1 [::]
q2 [7] = .2

res, q_goal, error = graph.applyNodeConstraints ('placement', q2)

ps.setInitialConfig (q_init)
ps.addGoalConfig (q_goal)

v = vf.createViewer ()
pp = PathPlayer (v)

def solve():
    print("Recherche de solution en cours ...")
    ps.solve()
    print("Une solution a été trouvée")
    pp(0)
