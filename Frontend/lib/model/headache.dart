import 'node.dart';

Node constructTreeHead(){
  Node oneSideNode = Node("Pain and discomfort in head. We are trying to predict the cause",false, iconImage:"assets/onesidepain.png");
  Node switchSideNode = Node("Current Prediction - Migraine Likely. Can be self treated",false, iconImage:"assets/painswitchside.png");
  Node foreheadNode = Node("Current Prediction - Migraine Likely. Can be self treated",false, iconImage:"assets/forehead.png");
  Node throbbingNode = Node("Current Prediction - Migraine Likely. Can be self treated", false, iconImage:"assets/throbbing.png");
  Node eyeNode = Node("Current Prediction - Cluster Likely. Can be self treated",false, iconImage:"assets/aroundeyes.png");
  Node backHeadNode = Node("Current Prediction - Cervicogenic Likely. Can be self treated",false, iconImage:"assets/backofhead.png");
  Node nonThrobbingNode = Node("Current Prediction - Cervicogenic Likely. Can be self treated",false, iconImage:"assets/nonthrobbing.png");
  Node nosebridgeNode = Node("Current Prediction - Sinus Likely. Can be self treated", false, iconImage:"assets/nosebridg.png");
  Node allergyNode = Node("Current Prediction - Sinus Likely. Can be self treated", false, iconImage:"assets/stuffynose.png");
  Node squeezingNode = Node("Current Prediction - Tension Likely. Can be self treated", false, iconImage:"assets/squeezingnode.png");

  Node restNode = Node("Current Prediction - Take Rest. Rehydrate and avoid physical strain", true, iconImage:"assets/rest.png");
  Node migraineNode = Node("Current Prediction - Migraine", true, pageList: [0,1,2], iconImage:"assets/migraine.png");
  Node clusterNode = Node("Current Prediction - Cluster", true, pageList: [3,1,2], iconImage:"assets/clusterheadache.png");
  Node cervicogenicNode = Node("Current Prediction - Cervicogenic", true, pageList: [4,5], iconImage:"assets/servicogenic.png");
  Node sinusNode = Node("Current Prediction - Sinus", true, pageList: [6,7], iconImage:"assets/sinus.png");
  Node tensionNode = Node("Current Prediction - Tension", true, pageList: [1,2], iconImage:"assets/tension.png");
  Node mildNode = Node("Current Prediction - Mild Headache", true, iconImage:"assets/mild.png");


  oneSideNode.addResponse("My pain is limited to one side", switchSideNode);
  oneSideNode.addResponse("My pain is not limited to one side", nosebridgeNode);
  switchSideNode.addResponse("The pain switches sides", foreheadNode);
  switchSideNode.addResponse("The pain persists on the same side", backHeadNode);
  foreheadNode.addResponse("The pain is around my forehead and temples", throbbingNode);
  foreheadNode.addResponse("The pain is not around my forehead and temples", eyeNode);
  throbbingNode.addResponse("The pain is throbbing around my forehead", migraineNode);
  throbbingNode.addResponse("The pain is not throbbing", mildNode);
  eyeNode.addResponse("The pain is around my eye", clusterNode);
  eyeNode.addResponse("The pain is not around my eye", mildNode);
  backHeadNode.addResponse("The pain isat the back of my head", nonThrobbingNode);
  backHeadNode.addResponse("The pain is not at the back", nonThrobbingNode);
  nonThrobbingNode.addResponse("The pain is throbbing", cervicogenicNode);
  nonThrobbingNode.addResponse("The pain is not throbbing", cervicogenicNode);
  nosebridgeNode.addResponse("I have sneezing and a runny nose", allergyNode);
  nosebridgeNode.addResponse("I do not have sneezing and a runny nose", restNode);
  allergyNode.addResponse("I have a stuffy nose or allergies", sinusNode);
  allergyNode.addResponse("I do not have either", mildNode);
  squeezingNode.addResponse("The pain feels like a band squeezing around my head", tensionNode);
  squeezingNode.addResponse("There is no squeezing sensation", mildNode);

  return oneSideNode;

}