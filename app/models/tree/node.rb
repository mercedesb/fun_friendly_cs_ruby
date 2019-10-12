# frozen_string_literal: true

class Tree::Node < ApplicationRecord
  self.table_name = 'tree_nodes'

  belongs_to :parent, class_name: 'Tree::Node', optional: true
  has_many :children, foreign_key: 'parent_id', class_name: 'Tree::Node'
  validates_presence_of :data

  def add_child(node)
    children << node
  end
end
