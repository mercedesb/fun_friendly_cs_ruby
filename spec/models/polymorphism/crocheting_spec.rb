# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Polymorphism::Crocheting do
  let(:craft) { Polymorphism::Crocheting.new(5) }

  it 'has a valid constructor' do
    expect(craft).to be_kind_of(Polymorphism::Crocheting)
  end

  describe 'create_fabric' do
    it 'is defined' do
      expect(craft).to respond_to(:create_fabric)
    end

    it 'takes one number argument' do
      expect { craft.create_fabric }.to raise_error(ArgumentError)

      expect { craft.create_fabric('three') }.to raise_error(RuntimeError)

      expect { craft.create_fabric(30) }.to_not raise_error
    end

    it 'returns an array' do
      expect(craft.create_fabric(5)).to be_kind_of(Array)
    end
  end
end
