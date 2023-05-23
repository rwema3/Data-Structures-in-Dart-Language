import 'dart:io';

class Array {
  List<int> array;
  int numberOfElements;

  Array(int max) {
    array = new List<int>(max);
    numberOfElements = 0;
  }

  void insert(int value) {
    array[numberOfElements] = value;
    numberOfElements ++;
  }

  void display() {
    for (int i = 0; i < numberOfElements; i ++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }

  void mergeSort() {
    List<int> workSpace = new List<int>(numberOfElements);
    _recursiveMergeSort(workSpace, 0, numberOfElements - 1);
  }

  void _recursiveMergeSort(List<int> workSpace, int lowerBound, int upperBound) {
    if (lowerBound == upperBound) {
      return;
    } else {
      int mid = (lowerBound + upperBound) ~/ 2;
      _recursiveMergeSort(workSpace, lowerBound, mid);
      _recursiveMergeSort(workSpace, mid + 1, upperBound);
      _merge(workSpace, lowerBound, mid + 1, upperBound);
    }
  }

