class Node{
  String comment ="";
  bool endNodeStatus = false;
  var responses = new Map<String,Node>();
  List<int> pageList = [];
  String iconImage = "assets/temp3.png";

  Node(String comment, bool endNodeStatus, {List<int> pageList=const [], String iconImage="assets/temp3.png"} ){
    this.comment = comment;
    this.endNodeStatus = endNodeStatus;
    this.pageList = pageList;
    this.iconImage = iconImage;
  }

  void addResponse(String input, Node newNode){
    responses[input] = newNode;
  }


  List<String> getResponses(){
    List<String> newList = [];
    for(var key in responses.keys){
      newList.add(key);
    }
    return newList;
  }

  String getComment(){
    return comment;
  }


  String getIconImage(){
    return iconImage;
  }

  List<int> getPageList(){
    return pageList;
  }

  Node? getNextNode(String input){
    return responses[input];
  }

  bool isEndNode(){
    return endNodeStatus;
  }
}