# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recursion::NestingDollCollection do
  it 'has a valid constructor' do
    expect(Recursion::NestingDollCollection.new(7)).to be_kind_of(Recursion::NestingDollCollection)
  end

  describe 'count' do
    it 'accurately counts the number of nested dolls' do
      expect(Recursion::NestingDollCollection.new(7).count).to eq(7)
      expect(Recursion::NestingDollCollection.new(3).count).to eq(3)
      expect(Recursion::NestingDollCollection.new(10).count).to eq(10)
    end
  end
end
