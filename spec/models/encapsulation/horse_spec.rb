# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Encapsulation::Horse do
  let(:horse) { Encapsulation::Horse.new }

  it 'has a valid constructor' do
    expect(horse).to be_kind_of(Encapsulation::Horse)
  end

  it 'does not allow you to mutate the leg positions directly' do
    initial_front_leg_position = horse.front_left_leg_position

    expect { horse.front_left_leg_position = Encapsulation::Horse::LegPosition::UP }.to raise_error(NoMethodError)
    expect(horse.front_left_leg_position).to eq(initial_front_leg_position)
  end

  describe 'movement methods' do
    let(:steps) { rand(10..1000) }

    describe 'walk' do
      it 'returns an object with the correct shape' do
        expect(horse.walk(steps)).to include(steps: be_a(Integer), time: be_a(Numeric), distance_traveled: be_a(Numeric))
      end
    end

    describe 'trot' do
      it 'returns an object with the correct shape' do
        expect(horse.trot(steps)).to include(steps: be_a(Integer), time: be_a(Numeric), distance_traveled: be_a(Numeric))
      end
    end

    describe 'canter' do
      it 'returns an object with the correct shape' do
        expect(horse.canter(steps)).to include(steps: be_a(Integer), time: be_a(Numeric), distance_traveled: be_a(Numeric))
      end
    end

    describe 'gallop' do
      it 'returns an object with the correct shape' do
        expect(horse.gallop(steps)).to include(steps: be_a(Integer), time: be_a(Numeric), distance_traveled: be_a(Numeric))
      end
    end
  end
end
