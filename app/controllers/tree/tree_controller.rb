# frozen_string_literal: true

class Tree::TreeController < ApplicationController
  def index
    @progress = "You haven't chosen anyone to go through the maze yet :("
  end

  def harry_worst_iterative
    route = triwizard_maze.iterative_breadth_first_search(harrys_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def harry_worst_recursive
    route = triwizard_maze.recursive_breadth_first_search(harrys_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def harry_best_iterative
    route = triwizard_maze.iterative_depth_first_search(harrys_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def harry_best_recursive
    route = triwizard_maze.recursive_depth_first_search(harrys_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def cedric_worst_iterative
    route = triwizard_maze.iterative_breadth_first_search(cedrics_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def cedric_worst_recursive
    route = triwizard_maze.recursive_breadth_first_search(cedrics_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def cedric_best_iterative
    route = triwizard_maze.iterative_depth_first_search(cedrics_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  def cedric_best_recursive
    route = triwizard_maze.recursive_depth_first_search(cedrics_entry_point, search_path_name, found_the_triwizard_cup)
    @progress = render_route(route)
    render :index
  end

  private

  def triwizard_maze
    @triwizard_maze ||= initialize_triwizard_maze
  end

  def initialize_triwizard_maze
    if Tree::Tree.any?
      Tree::Tree.first
    else
      root = Tree::Node.create(data: 'start')
      one = Tree::Node.create(data: { name: '1', who: 'Harry' }.to_json)
      two = Tree::Node.create(data: { name: '2', who: 'Cedric' }.to_json)
      root.add_child(one)
      root.add_child(two)

      three = Tree::Node.create(data: { name: '3' }.to_json)
      four = Tree::Node.create(data: { name: '4' }.to_json)
      five = Tree::Node.create(data: { name: '5' }.to_json)
      six = Tree::Node.create(data: { name: '6' }.to_json)
      one.add_child(three)
      one.add_child(four)
      two.add_child(five)
      two.add_child(six)

      seven = Tree::Node.create(data: { name: '7' }.to_json)
      eight = Tree::Node.create(data: { name: '8' }.to_json)
      nine = Tree::Node.create(data: { name: '9' }.to_json)
      ten = Tree::Node.create(data: { name: '10' }.to_json)
      three.add_child(seven)
      three.add_child(eight)
      six.add_child(nine)
      six.add_child(ten)

      eleven = Tree::Node.create(data: { name: '11' }.to_json)
      twelve = Tree::Node.create(data: { name: '12' }.to_json)
      thirteen = Tree::Node.create(data: { name: '13' }.to_json)
      fourteen = Tree::Node.create(data: { name: '14' }.to_json)
      fifteen = Tree::Node.create(data: { name: '15' }.to_json)
      eight.add_child(eleven)
      eight.add_child(twelve)
      ten.add_child(thirteen)
      ten.add_child(fourteen)
      ten.add_child(fifteen)

      sixteen = Tree::Node.create(data: { name: '16', triwizard_cup: true }.to_json)
      seventeen = Tree::Node.create(data: { name: '17' }.to_json)
      eighteen = Tree::Node.create(data: { name: '18' }.to_json)
      nineteen = Tree::Node.create(data: { name: '19' }.to_json)
      eleven.add_child(sixteen)
      eleven.add_child(seventeen)
      fourteen.add_child(eighteen)
      fourteen.add_child(nineteen)

      twenty = Tree::Node.create(data: { name: '20' }.to_json)
      twentyone = Tree::Node.create(data: { name: '21' }.to_json)
      twentytwo = Tree::Node.create(data: { name: '22' }.to_json)
      nineteen.add_child(twenty)
      nineteen.add_child(twentyone)
      nineteen.add_child(twentytwo)

      twentythree = Tree::Node.create(data: { name: '23' }.to_json)
      twentyfour = Tree::Node.create(data: { name: '24', triwizard_cup: true }.to_json)
      twenty.add_child(twentythree)
      twenty.add_child(twentyfour)

      Tree::Tree.create(root: root)
    end
  end

  def found_the_triwizard_cup
    proc do |node|
      JSON.parse(node.data).symbolize_keys[:triwizard_cup]
    end
  end

  def search_path_name
    proc do |node|
      JSON.parse(node.data).symbolize_keys[:name]
    end
  end

  def harrys_entry_point
    triwizard_maze.root.children.where('data LIKE ?', '%Harry%').first
  end

  def cedrics_entry_point
    triwizard_maze.root.children.where('data LIKE ?', '%Cedric%').first
  end

  def render_route(route)
    route.join(' -> ')
  end
end
