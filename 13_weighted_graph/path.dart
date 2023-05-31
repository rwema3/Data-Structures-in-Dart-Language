import 'dart:io';

class Vertex {
  String label;
  bool isInTree;

  Vertex(this.label) {
    isInTree = false;
  }
}

class DistPar {
  int distance;
  int parentVert;

  DistPar(this.parentVert, this.distance);
}

class GraphPath {
  final int maxVerts = 20;
  final int INFINITY = 1000000;
  List<Vertex> vertexList;
  List<List<int>> adjMat;
  int nVerts;
  int nTree;
  int currentVert;
  List<DistPar> sPath;
  int startToCurrent;

  GraphPath() {
    nTree = 0;
    currentVert = 0;
    startToCurrent = 0;
    nVerts = 0;
    vertexList = new List<Vertex>(maxVerts);
    adjMat = new List.generate(maxVerts, (int i) => new List(maxVerts));
    for(int i = 0; i < maxVerts; i ++) {
      for(int j = 0; j < maxVerts; j ++) {
        adjMat[i][j] = INFINITY;
      }
    }

    sPath = new List<DistPar>(maxVerts);
  }

  void addVertex(String label) {
    vertexList[nVerts++] = new Vertex(label);
  }

  void addEdge(int start, int end, int weight) {
    adjMat[start][end] = weight;
  }

  void path() {
    int startTree = 0;
    vertexList[startTree].isInTree = true;
    nTree = 1;

    for(int i = 0; i < nVerts; i ++) {
      int tempDist = adjMat[startTree][i];
      sPath[i] = new DistPar(startTree, tempDist);
    }

    while(nTree < nVerts) {
      int indexMin = getMin();
      int minDist = sPath[indexMin].distance;

      if(minDist == INFINITY) {
        stdout.writeln('There are unreachable verices');

