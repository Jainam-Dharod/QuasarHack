import 'node.dart';

Node constructTreeHeart(){
  Node chestPainAndStrokeNode = new Node("Current Prediction - Stroke Likely. Might need medical intervention",false, iconImage:"assets/temp1.png");
  Node shakingNode = new Node("Current Prediction - Panic Attack Likely. Can be self treated",false, iconImage:"assets/temp2.png");
  Node nauseaVomittingTinglingNode = new Node("Current Prediction - Panic Attack Likely. Can be self treated",false, iconImage:"assets/temp3.png");
  Node odSymptomsNode = new Node("Current Prediction - Overdose Likely. Might need medical intervention", false, iconImage:"assets/temp4.png");
  Node chestPainNode = new Node("Current Prediction - Heart Attack Likely. Might need medical intervention",false, iconImage:"assets/temp5.png");
  Node radiatingPainNode = new Node("Current Prediction - Heart Attack Likely. Might need medical intervention",false, iconImage:"assets/temp6.png");
  Node shortnessOfBreathNode = new Node("Current Prediction - Asthma Likely. Can be self treated",false, iconImage:"assets/temp7.png");

  Node panicAttackNode = new Node("Current Prediction - Panic Attack. A panic attack is a sudden episode of intense fear that triggers severe physical reactions when there is no real danger or apparent cause. Stay with the person, keep calm and move the person to a quiet place. Help slow the person's breathing. You can do this by breathing with him or her or by counting slowly to 10. ", true, iconImage:"assets/temp1.png");
  Node overDoseNode = new Node("Current Prediction - Overdose. Overdose is a critical condition. It is recommended to call the ambulance immediately. You can do this using the SOS button. Meanwhile monitor the patient's breating and perform rescue breathing if required", true, iconImage:"assets/temp2.png");
  Node asthmaNode = new Node("Current Prediction - Asthma. Make sure the patient sits upright and help them use an inhaler. If the problem persists, use the SOS button to call for help", true, iconImage:"assets/temp3.png");
  Node heartAttackNode = new Node("Current Prediction - Heart Attack. Please call the ambulance. Have the person sit down and loosen any tight clothing. Ask if the person takes any chest pain medicine, such as nitroglycerin for a known heart condition, and help them take it.", true, iconImage:"assets/temp4.png");
  Node noEmergencyNode = new Node("Current Prediction - Try to keep the person calm", true, iconImage:"assets/temp5.png");
  Node strokeNode = new Node("Current Prediction - Stroke. This is a critical situation. Please call the ambulance immediately using the SOS button. Have the person sit down, rest, and try to keep calm. Do not let the person sleep. Do not give them food, medication or drinks", true, iconImage:"assets/temp6.png");

  chestPainAndStrokeNode.addResponse("I have chest pain and symptoms of stroke",strokeNode);
  chestPainAndStrokeNode.addResponse("I do not have chest pain and symptoms of stroke",shakingNode);
  shakingNode.addResponse("Shaking is present",nauseaVomittingTinglingNode);
  shakingNode.addResponse("Shaking is not present",chestPainNode);
  nauseaVomittingTinglingNode.addResponse("I have nausea,vomitting and tingling in my arms",panicAttackNode);
  nauseaVomittingTinglingNode.addResponse("I do not have nausea,vomitting and tingling in my arms",odSymptomsNode);
  odSymptomsNode.addResponse("I am exhibiting symptoms of OD",overDoseNode);
  odSymptomsNode.addResponse("I am not exhibiting symptoms of OD",chestPainNode);
  chestPainNode.addResponse("I have chest pain",radiatingPainNode);
  chestPainNode.addResponse("I do not have chest pain",shortnessOfBreathNode);
  radiatingPainNode.addResponse("I have radiating pain",heartAttackNode);
  radiatingPainNode.addResponse("I do not have a sharp pain",panicAttackNode);
  shortnessOfBreathNode.addResponse("I have a filling in my tooth",asthmaNode);
  shortnessOfBreathNode.addResponse("I do not have a filling in my tooth",noEmergencyNode);

  return chestPainAndStrokeNode;

}