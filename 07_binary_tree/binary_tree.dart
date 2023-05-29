import 'dart:io';
import 'dart:collection';

class Node {
  int iData;
  double dData;
  Node leftChild;
  Node rightChild;

  void displayNode() {
    stdout.write('{');
    stdout.write(iData);
    stdout.write(', ');
    stdout.write(dData);
    stdout.write('}');
  }
}