import 'dart:io';
import 'dart:math';

class Link {
  int data;
  Link next;

  Link(int this.data){}

  int getKey() {
    return data;
  }

  void displayLink() {
    stdout.write('$data ');
  }
}

class SortedList {
  Link first;

  SortedList() {
    first = null;
  }

  /// Insert in ordered
  void insert(Link link) {
    int key = link.getKey();
    Link previous = null;
    Link current = first;

    while (current != null && key > current.getKey()) {
      previous = current;