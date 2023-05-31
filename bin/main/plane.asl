// Agent plane in project plane_landing_system

/* Initial beliefs and rules */

/* Initial goals */

/* Plans */

+!land_or_takeoff : has_permission
<- .my_name(Name);
	.send(controller, achieve, allow_landing_or_takeoff(Name));
   .print("waiting response");
   .wait(1000);
   !land_or_takeoff.

+!complete_landing_or_takeoff : permission_granted
<- .my_name(Name);
   .send(controller, tell, permission_complete(Name));
   .kill_agent(Name).

+permission_granted 
<- !complete_landing_or_takeoff.
        
+permission_denied 
<- 	!land_or_takeoff.



{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

{ include("$moiseJar/asl/org-obedient.asl") }
