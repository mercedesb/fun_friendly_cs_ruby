# frozen_string_literal: true

class Inheritance::Geranium < Inheritance::Plant
  def initialize
    @name = 'Geranium'
    @sun = true
    @wet = false
    @light_needs = '4 - 6 hours of direct sunlight per day.'
    @soil_needs = 'Plant in a pot with soil-less potting mixture and good drainage.'
    @water_needs = 'Water thoroughly and allow to soil to completely dry between waterings.'
  end
end
