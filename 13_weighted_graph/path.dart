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

