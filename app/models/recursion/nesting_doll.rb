# frozen_string_literal: true

class Recursion::NestingDoll
  attr_reader :opens, :child

  def initialize(opens)
    @opens = opens
    @child = nil
  end

  def add_child(child_opens)
    @child = Recursion::NestingDoll.new(child_opens)
  end

  def open
    child if opens
  end
end
