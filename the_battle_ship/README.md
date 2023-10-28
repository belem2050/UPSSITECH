# The-BattleShip

## How to run ?
A user manual is in /data :https://github.com/BELEMMoumouni/The-BattleShip/blob/main/data/User%20manual%20battleship.pdf translated from french into english with DEEPL

## Subject






This example corresponds to the modeling of a naval battle. The principles are the following:
 - the game is composed of 3 teams and a game board (which will include in particular a "drawing" to visualize the state of the game and the movement of the ships); 
- each team is composed of a list of ships and can be either a battalion (military status) or fishermen (neutral status); we will consider that there are two military teams and one neutral one;
 - the ships are therefore either warships or fishing boats; there are 2 types of warships (destroyers and submarines) and only 1 type of pˆeche boat (trawlers); destroyers and trawlers are surface ships while submarines are deep sea ships ;
 - one of the three teams will be played by the computer, while the other two will be played by humans; the assignment of the rˆoles will be done by drawing lots when the game is launched ;
 - during the game, each team will have to choose in turn a ship in its list and the action to be performed (moving, shooting, fishing); the choices of the human teams will be made by interaction with the players (keyboard input) while those of the artificial team will be made by random draw; 
- each ship is likely to be sunk by a shot from a warship; and the submarines are likely to be damaged by the trawlers (propellers caught in the trawl); in this case, they are not sunk but they can no longer move; - the movement and shooting capabilities depend on each ship; in each box of the drawing, there can be only one surface ship and one deep-sea ship at most; for simplicity, we will consider that a ship occupies only one box and therefore that a single shot at the goal is enough to sink it; de mˆeme, for a submarine to be damaged, it is enough for it to be under a trawler when the latter is pˆeche ; 
- the end of the game occurs as soon as one of the 3 teams has no more ships; the winner is the team that has the most valid ships left (i.e. not sunk and not damaged); this can be the fishermen's team. From the point of view of the Java architecture, there are the following elements: 
- Game: management of the Board and the 3 Teams; initial distribution of the type of players; enchaˆınement of the moves, r'ecup'eration of the choices of each team and repercussion on the Board for visualization and on the 'teams for the continuation of the game; detection and stopping of the game ; 
- Board : management of a matrix of Board Cases and visualization of the impact of each move;
 - Case Plateau : detection and management of the occupation (empty or not, occupied by what); 
- Team: management of a set of ships, definition of an order according to the type of the team (if human then interface of seizure of the orders, if AI then drawing of the orders);
 - Eq Battalion: Team with firing capability (impact on the type of command available); - EqFisher: Team with impact capability on the type of command available) ;
 - Command: the set of information needed for a 'game step: the team acting, the ship involved, the action to be done (move, Fire, Pˆeche), the direction in which to do this action (in case of move or fire) ;
 - Ship : ability to move and access to the current state; 
- VesselSurface : Vessel with a level of occupation on the surface;
 - ShipDepth : Ship with depth occupancy level 
- Destroyer: Surface ship with refinement of movement and firing capabilities (range), current state being either valid or sunk;
 - Submarine: VesselDepth with refinement of movement and firing capabilities (range), current state being either valid, sunk or damaged; 
- Trawler: Surface vessel with refinement of displacement ́e capability, current state''being either valid or coul ́e. The breakdown between interfaces, classes, and enum could ˆetre as follows: interfaces: Player, JHuman (h'erite of Player), JIA (h'erite of Player); classes: Game, Board, CaseBoard, Team (implements JHuman and JIA), EqBattalion (inherits from Team), EqFisher (inherits from Team), Command, Ship, ShipSurface (inherits from Ship), ShipDepth (h'erite from Ship), Destroyer (inherits from ShipSurface), SubMarine (inherits from ShipDepth), Trawler (h'erite from ShipSurface);
 enum: Status (military or neutral), Nature (human or AI), TypeNav (trawler, destroyer or submarine), Action (moving or shooting or fishing), Direction (the 4 cardinal points) Note also at least two types of exception: 
- OccupationException: to deal with the case where a move would not be possible because there are already too many ships in the targeted cell, 
- LimitException : to deal with the case where a move or a shot would not be possible because the targeted position would be outside the board.

