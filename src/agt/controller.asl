// Agent controller in project plane_landing_system

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+!allow_landing_or_takeoff(PlaneID): runway_free & not processing_request
<- +processing_request; 	
.print("permission given");
	-runway_free;
	+runway_occupied;
	.send(PlaneID, tell, permission_granted);
	-processing_request.

+!allow_landing_or_takeoff(PlaneID): runway_occupied | (runway_free & processing_request)
<-	.print("permission denied"); 
.send(PlaneID, tell, permission_denied).

+permission_complete(Name)
<- .print("successful landing ",Name);
	-runway_occupied;
	+runway_free;
	-permission_complete. 
	


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
{ include("$moiseJar/asl/org-obedient.asl") }
