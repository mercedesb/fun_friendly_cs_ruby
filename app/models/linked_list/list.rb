# frozen_string_literal: true

class LinkedList::List < ApplicationRecord
  belongs_to :head, class_name: 'LinkedList::Node', optional: true
  belongs_to :tail, class_name: 'LinkedList::Node', optional: true
  before_destroy :destroy_nodes

  def add(data)
    new_node = LinkedList::Node.create(data: data)
    if head.nil?
      self.head = new_node
    else
      tail.update(next: new_node)
    end

    self.tail = new_node

    save
    reload
    new_node
  end

  def remove
    remove_head
  end

  def insert(data, index)
    return nil if index.negative?

    new_node = LinkedList::Node.create(data: data)

    if index.zero?
      new_node.next = head
      update(head: new_node)
    else
      current = head
      previous = nil
      i = 0

      while !current.nil? && i < index
        previous = current
        current = current.next
        i += 1
      end

      # found where to insert the new node
      if !current.nil?
        previous.update(next: new_node)
        new_node.update(next: current)
      elsif previous == tail
        add(data)
      end
    end
    new_node
  end

  def remove_head
    return head if head.nil?

    removed = head
    update(head: head.next)
    removed.update(next: nil)
    removed
  end

  def remove_tail
    return tail if tail.nil?

    current = head
    previous = nil

    until current.next.nil?
      previous = current
      current = current.next
    end

    removed = tail
    update(tail: previous)
    removed
  end

  private

  def destroy_nodes
    current = head
    update(head: nil, tail: nil)

    until current.nil?
      previous = current
      current = current.next
      previous.destroy
    end
  end
end
