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
      } else {
        current = current.rightChild;
      }
      if (current == null) {
        return null;
      }
    }
    return current;
  }

  void insert(int key, double dd) {
    Node newNode = new Node();
    newNode.iData = key;
    newNode.dData = dd;
    if (root == null) {
      root = newNode;
    } else {
      Node current = root;
      Node parent;
      while (true) {
        parent = current;
        if (key < current.iData) {
          current = current.leftChild;
          if (current == null) {
            parent.leftChild = newNode;
            return;
          }
        } else {
          current = current.rightChild;
          if (current == null) {
            parent.rightChild = newNode;
            return;
          }
        }
      }
    }
  }

  Node minimum() {
    Node current = root;
    Node last;
    while (current != null) {
      last = current;
      current = current.leftChild;
    }
    return last;
  }

  bool delete(int key) {
    Node current = root;
    Node parent = root;
    bool isLeftChild = true;

    while (current.iData != key) {
      parent = current;
      if (key < current.iData) {
        isLeftChild = true;
        current = current.leftChild;
      } else {
        isLeftChild = false;
        current = current.rightChild;
      }
      if (current == null) {
        return false;
      }
      if (current.leftChild == null && current.rightChild == null) {
        if (current == root) {
          root = null;
        } else if (isLeftChild) {
          parent.leftChild = null;
        } else {
          parent.rightChild = null;
        }
      } else if (current.rightChild == null) {
        if (current == root) {
          root = current.leftChild;
        } else if (isLeftChild) {
          parent.leftChild = current.leftChild;
        } else {
          parent.rightChild = current.leftChild;
        }
      } else if (current.leftChild == null) {
        if (current == root) {
          root = current.rightChild;
        } else if (isLeftChild) {
          parent.leftChild = current.rightChild;
        } else {
          parent.rightChild = current.rightChild;
        }
      } else {
        Node successor = getSuccessor(current);
        if (current == root) {
          root = successor;
        } else if (isLeftChild) {
          parent.leftChild = successor;
        } else {
          parent.rightChild = successor;
          // successor.leftChild = current.leftChild;
        }
      }
    }
    return true;    
  }

  Node getSuccessor(Node delNode) {
    Node successorParent = delNode;
    Node successor = delNode;
    Node current = delNode.rightChild;

    while (current != null) {
      successorParent = successor;
      successor = current;
      current = current.leftChild;
    }
    if (successor != delNode.rightChild) {
