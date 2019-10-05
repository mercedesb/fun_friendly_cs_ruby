# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inheritance::Coleus do
  let(:plant) { Inheritance::Coleus.new }

  it 'has a valid constructor' do
    expect(plant).to be_kind_of(Inheritance::Coleus)
  end

  it 'is a child of Plant' do
    expect(plant).to be_kind_of(Inheritance::Plant)
  end

  describe 'Methods from Plant (super class)' do
    describe 'name' do
      it 'is defined' do
        expect(plant).to respond_to(:name)
      end
    end

    describe 'sun' do
      it 'is defined' do
        expect(plant).to respond_to(:sun)
      end
    end

    describe 'shade' do
      it 'is defined' do
        expect(plant).to respond_to(:shade)
      end
    end

    describe 'wet' do
      it 'is defined' do
        expect(plant).to respond_to(:wet)
      end
    end

    describe 'dry' do
      it 'is defined' do
        expect(plant).to respond_to(:dry)
      end
    end

    describe 'light_needs' do
      it 'is defined' do
        expect(plant).to respond_to(:light_needs)
      end
    end

    describe 'water_needs' do
      it 'is defined' do
        expect(plant).to respond_to(:water_needs)
      end
    end

    describe 'soil_needs' do
      it 'is defined' do
        expect(plant).to respond_to(:soil_needs)
      end
    end

    describe 'planting_instructions' do
      it 'is defined' do
        expect(plant).to respond_to(:planting_instructions)
      end
    end

    describe 'care_instructions' do
      it 'is defined' do
        expect(plant).to respond_to(:care_instructions)
      end
    end

    describe 'learn_how_to_garden' do
      it 'is defined' do
        expect(plant).to respond_to(:learn_how_to_garden)
      end
    end
  end
end
