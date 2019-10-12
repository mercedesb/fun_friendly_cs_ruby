# frozen_string_literal: true

class Tree::Tree < ApplicationRecord
  belongs_to :root, class_name: 'Tree::Node', optional: true

  def iterative_breadth_first_search(root_node, get_search_path, success_criteria)
    # Check that a root node exists.
    return if root_node.nil?

    # Create our queue and push our root node into it.
    visited_nodes = Queues::Queue.new
    visited_nodes.enqueue(root_node.id)
    found_node = nil
    search_path = []

    # Continue searching through as queue as long as it's not empty.
    while !visited_nodes.tail.nil? && !found_node
      node_id = visited_nodes.dequeue.data.to_i
      current_node = Tree::Node.find(node_id)
      search_path << get_search_path.call(current_node)

      found_node = success_criteria.call(current_node)
      search_path << 'Success!' if found_node

      current_node.children.each do |child|
        visited_nodes.enqueue(child.id) if child
      end
    end

    visited_nodes.destroy
    search_path
  end

  def recursive_breadth_first_search(root_node, get_search_path, success_criteria)
    visited_nodes = Queues::Queue.new
    visited_nodes.enqueue(root_node.id)
    search_path = []
    recursive_bfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
    search_path
  end

  def recursive_bfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
    return if visited_nodes.tail.nil? # if the queue is empty, we're done.

    node_id = visited_nodes.dequeue.data.to_i
    current_node = Tree::Node.find(node_id)
    search_path << get_search_path.call(current_node)

    found_node = success_criteria.call(current_node)

    if found_node
      search_path << 'Success!'
      visited_nodes.destroy # if we found a successful path, we're done
    else
      current_node.children.each do |child|
        visited_nodes.enqueue(child.id) if child
      end
    end

    recursive_bfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
  end

  def iterative_depth_first_search(root_node, get_search_path, success_criteria)
    # Check that a root node exists.
    return if root_node.nil?

    # Create our queue and push our root node into it.
    visited_nodes = Stack::Stack.new
    visited_nodes.push(root_node.id)
    found_node = nil
    search_path = []

    # Continue searching through as stack as long as it's not empty.
    while !visited_nodes.head.nil? && !found_node
      node_id = visited_nodes.pop.data.to_i
      current_node = Tree::Node.find(node_id)
      search_path << get_search_path.call(current_node)

      found_node = success_criteria.call(current_node)
      search_path << 'Success!' if found_node

      current_node.children.each do |child|
        visited_nodes.push(child.id) if child
      end
    end

    visited_nodes.destroy
    search_path
  end

  def recursive_depth_first_search(root_node, get_search_path, success_criteria)
    visited_nodes = Stack::Stack.new
    visited_nodes.push(root_node.id)
    search_path = []
    recursive_dfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
    search_path
  end

  def recursive_dfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
    return if visited_nodes.head.nil? # if the stack is empty, we're done.

    node_id = visited_nodes.pop.data.to_i
    current_node = Tree::Node.find(node_id)
    search_path << get_search_path.call(current_node)

    found_node = success_criteria.call(current_node)

    if found_node
      search_path << 'Success!'
      visited_nodes.destroy # if we found a successful path, we're done
    else
      current_node.children.each do |child|
        visited_nodes.push(child.id) if child
      end
    end

    recursive_dfs_logic(visited_nodes, get_search_path, success_criteria, search_path)
  end
end
