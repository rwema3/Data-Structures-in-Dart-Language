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

class Tree {
  Node root;

  Tree() {
    root = null;
  }

  Node find(int key) {
    Node current = root;
    while (current.iData != key) {
      if (key < current.iData) {
        current = current.leftChild;
      } e