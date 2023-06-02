// Agent plane in project plane_landing_system

/* Initial beliefs and rules */

/* Initial goals */

/* Plans */

+!land_or_takeoff : has_permission
<- .my_name(Name);
	.send(controller, achieve, allow_landing_or_takeoff(Name));
   .print("waiting response");
   .wait(1000);
   +waiting.

+!complete_landing_or_takeoff : permission_granted
<- .my_name(Name);
   .send(controller, tell, permission_complete(Name));
   .print(Name," has landed");
   .kill_agent(Name).

+waiting : permission_granted 
<- -waiting;
!complete_landing_or_takeoff.
        
+waiting : permission_denied 
<- 	-waiting;
!land_or_takeoff.

+waiting
<- !land_or_takeoff.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

{ include("$moiseJar/asl/org-obedient.asl") }
