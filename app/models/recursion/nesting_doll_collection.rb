# frozen_string_literal: true

class Recursion::NestingDollCollection
  attr_reader :big_doll

  def initialize(number)
    @big_doll = Recursion::NestingDoll.new(true)
    nest_dolls(number - 1, big_doll)
  end

  def count
    count_nested_dolls(big_doll)
  end

  def count_nested_dolls(doll)
    child = doll.open

    # base case
    return 1 unless child

    count_nested_dolls(child) + 1
  end

  def nest_dolls(number, doll)
    # base case
    if number <= 1
      doll.add_child(false)
    else
      doll.add_child(true)
      nest_dolls(number - 1, doll.child)
    end
  end
end
