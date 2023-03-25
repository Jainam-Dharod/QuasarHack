import 'node.dart';

Node constructTreeChest(){
  Node blueLipsNode = Node("Pain or discomfort in chest. We are trying to predict the cause",false, iconImage:"assets/temp1.png");
  Node feverChillsNode = Node("Current Prediction - Flu Likely. Can be self treated",false, iconImage:"assets/temp2.png");
  Node weaknessNode = Node("Current Prediction - Flu Likely. Can be self treated",false, iconImage:"assets/temp3.png");
  Node sneezingNode = Node("Current Prediction - Cold Likely. Can be self treated", false, iconImage:"assets/temp4.png");

  Node pneumoNode = Node("Current Prediction - Pneumonia", true, pageList: [3,2], iconImage:"assets/temp5.png");
  Node fluNode = Node("Current Prediction - Flu",true, pageList: [5,4,2,1], iconImage:"assets/temp6.png");
  Node coldNode = Node("Current Prediction - Cold", true,pageList: [5,4,2,1], iconImage:"assets/temp7.png");
  Node restNode = Node("Current Prediction - Mild Discomfort", true, iconImage:"assets/temp1.png");

  blueLipsNode.addResponse("My lips are blue", pneumoNode);
  blueLipsNode.addResponse("My lips are not blue", feverChillsNode);
  feverChillsNode.addResponse("I have weakness or headache", fluNode);
  feverChillsNode.addResponse("I do not have weakness or headache", coldNode);
  sneezingNode.addResponse("I have sneezing and a runny nose", coldNode);
  sneezingNode.addResponse("I do not have sneezing and a runny nose", restNode);
  weaknessNode.addResponse("I have weakness and headache", fluNode);
  weaknessNode.addResponse("I do not have weakness and headache", coldNode);
  return blueLipsNode;
}





