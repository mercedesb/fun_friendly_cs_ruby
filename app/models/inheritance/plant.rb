# frozen_string_literal: true

class Inheritance::Plant
  attr_reader :name, :light_needs, :water_needs, :soil_needs, :sun, :wet

  def initialize
    @name = null
    @light_needs = null
    @water_needs = null
    @soil_needs = null
    @sun = null
    @wet = null
  end

  def shade
    !sun
  end

  def dry
    !wet
  end

  def planting_instructions
    "Planting instructions: #{soil_needs}"
  end

  def care_instructions
    "Sunlight needs: #{light_needs}<br/>Watering instructions: #{water_needs}"
  end

  def learn_how_to_garden
    "#{name}<br/>#{planting_instructions}<br/>#{care_instructions}"
  end
end
