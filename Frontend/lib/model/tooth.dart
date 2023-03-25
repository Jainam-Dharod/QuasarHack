import 'node.dart';

Node constructTreeTeeth(){
  Node dullAndPersistentNode = new Node("Pain and discomfort in tooth or gums. We are trying to predict the cause",false, iconImage:"assets/temp1.png");
  Node foodTeethGumsNode = new Node("Current Prediction - Minor Injury Likely. Can be self treated",false, iconImage:"assets/temp2.png");
  Node sensitivityNode = Node("Current Prediction - Worn Down Enamel Likely. Might need medical intervention",false, iconImage:"assets/sensitivity.png");
  Node teethGrindingNode = Node("Current Prediction - Bruxism Likely. Might need medical intervention", false, iconImage:"assets/temp3.png");
  Node minorPainNode = Node("Current Prediction - Worn Down Enamel Likely. Might need medical intervention",false, iconImage:"assets/temp4.png");
  Node sharpPainNode = Node("Current Prediction - Fallen Crown Likely. Might need medical intervention",false, iconImage:"assets/temp5.png");
  Node fillingNode = Node("Current Prediction - Fallen Crown Likely. Might need medical intervention",false, iconImage:"assets/temp6.png");

  Node minorInjuryNode = Node("Current Prediction - Minor Injury", true, pageList: [0,4], iconImage:"assets/temp7.png");
  Node bruxismNode = Node("Current Prediction - Bruxism", true, pageList: [4], iconImage:"assets/temp1.png");
  Node absessedToothNode = Node("Current Prediction - Absessed Tooth", true, pageList: [4,7], iconImage:"assets/temp2.png");
  Node wornEnamelNode = Node("Current Prediction - Worn Down Enamel", true, pageList: [0,7], iconImage:"assets/temp3.png");
  Node gumDiseaseNode = Node("Current Prediction - Gum Disease", true, pageList: [0,7], iconImage:"assets/temp4.png");
  Node fallenCrownNode = Node("Current Prediction - Fallen Crown", true, pageList: [7,4], iconImage:"assets/temp5.png");
  Node cavityNode = Node("Current Prediction - Cavity",true, pageList: [7], iconImage:"assets/cavity.png");


  dullAndPersistentNode.addResponse("toothache is dull and persistent",foodTeethGumsNode);
  dullAndPersistentNode.addResponse("toothache is not dull and persistent",sensitivityNode);
  sensitivityNode.addResponse("Sensitivity is present",minorPainNode);
  sensitivityNode.addResponse("Sensitivity is not present",sharpPainNode);
  foodTeethGumsNode.addResponse("Food is lodged in teeth or gums",minorInjuryNode);
  foodTeethGumsNode.addResponse("Food is not lodged in teeth or gums",teethGrindingNode);
  teethGrindingNode.addResponse("I have a habit of grinding teeth",bruxismNode);
  teethGrindingNode.addResponse("I do not have a habit of grinding teeth",absessedToothNode);
  minorPainNode.addResponse("I have a minor teeting pain",wornEnamelNode);
  minorPainNode.addResponse("I do not have a minor teeting pain",gumDiseaseNode);
  sharpPainNode.addResponse("I have a sharp pain",fillingNode);
  sharpPainNode.addResponse("I do not have a sharp pain",minorInjuryNode);
  fillingNode.addResponse("I have a filling in my tooth",fallenCrownNode);
  fillingNode.addResponse("I do not have a filling in my tooth",cavityNode);

  return dullAndPersistentNode;
}




