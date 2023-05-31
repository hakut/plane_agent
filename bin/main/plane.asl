// Agent plane in project plane_landing_system

/* Initial beliefs and rules */

/* Initial goals */

/* Plans */

+!land_or_takeoff : has_permission
<- .my_name(Name);
	.send(controller, achieve, allow_landing_or_takeoff(Name));
   .print("waiting response").

+!complete_landing_or_takeoff : permission_granted
<- .my_name(Name); 
	.print("landed ",Name);
   .send(controller, tell, permission_complete(Name));
   -has_permission.

+!complete_landing_or_takeoff : permission_denied
<- .my_name(Name); 
	.print("not landed ",Name).

+permission_granted 
<- .print("permission taken");
!complete_landing_or_takeoff.
        
+permission_denied 
<- .print("permission denied");
	.wait(5000);
   !land_or_takeoff.



{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

{ include("$moiseJar/asl/org-obedient.asl") }
