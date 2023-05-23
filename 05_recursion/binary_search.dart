import 'dart:io';

class OrderedArray {
  List<int> a;
  int nElems;

  OrderedArray(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  int size() {
    return nElems;
  }

  int find(int searchKey) {
    return _recursionFind(searchKey, 0, nElems - 1);
  }
S