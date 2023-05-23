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

  int _recursionFind(int searchKey, int lowerBound, int upperBound) {
    int curIn;
    curIn = (lowerBound + upperBound) ~/ 2;
    if (a[curIn] == searchKey){
      return curIn;
    } else if (lowerBound > upperBound) {
      return nElems;
    } else {
      if (a[curIn] < searchKey) {
        return _recursionFind(searchKey, curIn + 1, upperBound);
      } else {
        return _recursionFind(searchKey, lowerBound, curIn - 1 );
      }
    }
  }

  void insert(int value) {        break;
