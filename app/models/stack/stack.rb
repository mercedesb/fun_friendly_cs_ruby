# frozen_string_literal: true

class Stack::Stack < LinkedList::List
  def push(data)
    new_node = LinkedList::Node.create(data: data)

    if head
      new_node.next = head
      new_node.save
    end

    self.head = new_node
    save
    reload
    new_node
  end

  def pop
    popped = head
    update(head: head.next)
    popped.update(next: nil)
    popped
  end

  # override default add behavior
  def add(data)
    push(data)
  end

  def insert(data, index)
    raise "Can't insert into the middle of a stack" if index.positive?

    super(data, index)
  end
end
