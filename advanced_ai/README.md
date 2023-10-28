# Advanced-AI
 Here is about to understand how work Markov Decision Process (MDP ) to make decisions for an AI.
 All about MDP : https://pymdptoolbox.readthedocs.io/en/latest/index.html
 # Subject
Consider a house-cleaning robot. It can be either in the living room or at its charging station - or out  of battery. 
The living room can be clean or dirty. So there are five states: LD(in the living room, dirty), LC(in the living room, clean), CD(at the charger, dirty), CC(at the charger, clean), O (out of power)..


####  
When in the living room,    the robot  can either choose to clean or to charge. 

When in the charging station, the robot can either choose to clean or to keep charging.

When out of order, any of the two actions (clean, charge) leads to the same results: staying out of power

####  

The reward for being  in a clean state is rc 

The reward for being in a dirty state is rd < rc at each time step

The reward for being out of power is  costcrash  -  lower or equal to rd ; let us set it equal to rd  (the living rooms becomes dirty anyway)
 

####  

When  the robot decides to  clean,
*  if it is in the living room, then it may become out of power with proba e
*  if it is in the charging station, no risk of running out of power   
*  cleaning a clean floor leaves it clean
*  cleaning a dirty floor can sometimes fail (even is battery is ok) - let eps be the probability of fail of the cleaning
     
When  the robot decides to  charge,  action charge always takes the robot to the charging station. The  dirtiness of the room can go from clean to dirty with a probability  pDust  and it stays for sure at the dirty level if dirty



## MDP modeling


![Cleaning robot BELEM Moumouni drawio-Page-1 drawio](https://user-images.githubusercontent.com/90107382/202426095-3961daa7-7070-496d-9fbc-7b26d5087297.png)

## MDP description

Firstly, from any state, two actions are possible and when one is chosen, the other one is 
not
.
 * LD,
   * When the robot chooses to clean, either it’s gonna be out of power with the probability e or it fails with eps or it does not neither fail nor goes out of power and logically gonna succeed the cleaning with ( 1 - e - eps ) .
   *  If it chooses to charge, it’s going to the dirty charger state because it’s coming from a dirty one. And this is for sure ( probability of 1 ).
* LC
  * As the logic with LD,if it decides to clean,  either it is going to  O with e or back to LC with ( 1 - e) because, even though it fails, the room is gonna remain clean.
  * Deciding to charge  can just lead to CC because it is going to clean the charger room. No possibility to go elsewhere.

* CD
   * Cleaning leads to a clean room if it succeeds or staying in a dirty one if not. 
   * As in LD, either it goes in LD with a probability of failure which is eps or succeeds and in this case, goes in LC with ( 1 - eps ). The difference with LD is that here, even if it fails, it just has one choice which is LD.
Charging in a dirty charging room leads to a dirty charging room because the dirtiness of the room is still going to be the same.

* CC
  * Cleaning in a clean room leads to a clean room. The only possible state is LC.
  * By charging, it could make the charging room dirty with pDUST so it could lead it to CD or not and stay in CC with ( 1 - pDust ).

* O
  * When the robot is out of battery, it can not make a decision. So in this case, either deciding to charge or clean leads to the same state O.


## How to run the project 
* The first file mdptp is an example to understand how work MDP ( Markov Decision Process ). You could check it for more details.
* The second one is all about described above and to run it, you need to be installed : 
  * mdptoolbox. Here is how to fix it : https://pymdptoolbox.readthedocs.io/en/latest/index.html
  * all python extensions such as numpy
        

