# frozen_string_literal: true

class Queues::Queue < LinkedList::List
  def enqueue(data)
    add(data)
  end

  def dequeue
    dequeued = head
    update(head: head.next)
    dequeued.update(next: nil)
    dequeued
  end

  def insert(_data, _index)
    raise "Can't insert into the middle of a queue"
  end
end
