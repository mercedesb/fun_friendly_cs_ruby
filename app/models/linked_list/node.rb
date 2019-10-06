# frozen_string_literal: true

class LinkedList::Node < ApplicationRecord
  validates_presence_of :data

  belongs_to :next, class_name: 'LinkedList::Node', optional: true
end
