import 'node.dart';

Node constructTreeInjury(){
  Node consciousNode = Node("Check Consciousness. Pupils should be responsive",false, iconImage:"assets/emergencyornot.png");
  Node obstructionNode = Node("Check Obstruction. Check whether airways are blocked",false, iconImage:"assets/mouthobstruc.png");
  Node pulseNode = Node("Check Pulse. It should be strong and even",false, iconImage:"assets/pulsecheck.png");
  Node bleedingNode = Node("Check Bleeding. Thoroughly check for all visible bleeds", false, iconImage:"assets/bleedingornot.png");
  Node pressureNode = Node("Apply Pressure. Try to stop as much bleeding as possible", false, iconImage:"assets/applypressure.png");
  Node cprNode = Node("Perform CPR. Push hard and fast on the center of the person's chest in a fairly rapid rhythm", false, iconImage:"assets/cpr.png");
  Node breathingNode = Node("Check Breathing. It should be even", false, iconImage:"assets/checkifbreathing.png");
  Node mtmNode = Node("Perform mouth to mouth resuscitation. Seal your mouth over their mouth and blow steadily", false, iconImage:"assets/mtm.png");
  Node removalNode = Node("Attempt Manual Removal. Try to clear the airway",false, iconImage:"assets/manualremoval.png");
  Node heimlichNode = Node("Perform Heimlich Maneuver. Bend the person at their waste and give back thrusts", false, iconImage:"assets/hamlich.png");

  Node monitorNode = Node("Keep monitoring vitals. Vitals include: \nApproximate breathing rate \nApproximate pulse rate \nPupils responsive",true, iconImage:"assets/monitoring.png");
  Node emergencyNode = Node("Condition Critical Call SOS \nContinue giving compressions \nPush hard and fast on the center of the person's chest in a fairly rapid rhythm — about 100 to 120 compressions a minute", true, iconImage:"assets/emergencynode.png");


  consciousNode.addResponse("The patient is conscious", bleedingNode);
  consciousNode.addResponse("The patient is unconscious", obstructionNode);
  obstructionNode.addResponse("The airway is clear", pulseNode);
  obstructionNode.addResponse("The airway is obstructed", removalNode);
  pulseNode.addResponse("Pulse is present and strong", bleedingNode);
  pulseNode.addResponse("Pulse is weak or absent", cprNode);
  bleedingNode.addResponse("There is profuse bleeding", pressureNode);
  bleedingNode.addResponse("There is little to no bleeding", monitorNode);
  pressureNode.addResponse("The bleeding is contained", monitorNode);
  pressureNode.addResponse("There is too much bleeding", emergencyNode);
  cprNode.addResponse("CPR Successful", breathingNode);
  cprNode.addResponse("Unsuccessful or don’t know CPR", emergencyNode);
  breathingNode.addResponse("Breathing is normal", monitorNode);
  breathingNode.addResponse("Breathing is abnormal", mtmNode);
  mtmNode.addResponse("Mouth to mouth successful", monitorNode);
  mtmNode.addResponse("Mouth to mouth unsuccessful", emergencyNode);
  removalNode.addResponse("Obstruction removed", pulseNode);
  removalNode.addResponse("Unable to remove obstruction", heimlichNode);
  heimlichNode.addResponse("Heimlich Maneuver successful", pulseNode);
  heimlichNode.addResponse("Do not know or unsuccessful Heimlich Maneuver", emergencyNode);

  return consciousNode;
}