class Node:
  def __init__(self, value = None):
    self.next = None
    self.value = value

class Queue:
  def __init__(self):
    self.head = None
    self.tail = None

  def enqueue(self, value):
    new_node = Node(value)
    if not self.head:
      self.head = new_node
      self.tail = new_node
    else:
      self.tail.next = new_node
      self.tail = new_node

  def dequeue(self):
    if not self.head:
      return None
    else:
      return_value = self.head.value
      if self.head == self.tail:
        self.head = None
        self.tail = None
      else:
        self.head = self.head.next
      return return_value
