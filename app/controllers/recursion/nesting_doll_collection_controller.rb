# frozen_string_literal: true

class Recursion::NestingDollCollectionController < ApplicationController
  def index
    @progress = "We haven't counted yet :("
  end

  def count
    random_number = rand(1..10)
    nesting_dolls = Recursion::NestingDollCollection.new(random_number)
    count = nesting_dolls.count
    @progress = "There are #{count} nested dolls"
    render :index
  end
end
