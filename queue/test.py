# To run tests, execute: 
# python test.py

import unittest
from queue import Queue

class TestQueue(unittest.TestCase):
  def test_empty_queue(self):
    queue = Queue()
    self.assertEqual(None, queue.dequeue())

  def test_enqueue(self):
    queue = Queue()
    queue.enqueue(4)
    self.assertEqual(4, queue.dequeue())
    self.assertEqual(None, queue.dequeue())

  def test_three_values(self):
    queue = Queue()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    self.assertEqual(1, queue.dequeue())
    self.assertEqual(2, queue.dequeue())
    self.assertEqual(3, queue.dequeue())
    self.assertEqual(None, queue.dequeue())

if __name__ == '__main__':
  unittest.main()
