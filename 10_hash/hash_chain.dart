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
      current = current.next;
    }
    if(previous == null) {
      first = link;
    } else {
      previous.next = link;
    }
    link.next = current;
  }

  /// Remove element
  void delete(int key) {
    Link previous = null;
    Link current = first;

    while (current != null && key != current.getKey()) {
      previous = current;
      current = current.next;
    }

    if (previous == null) {
      first = first.next;
    } else {
      previous.next = current.next;