# frozen_string_literal: true

class Inheritance::Begonia < Inheritance::Plant
  def initialize
    @name = 'Begonia'
    @sun = false
    @wet = true
    @light_needs = 'Partial shade with no direct sunlight.'
    @soil_needs = 'Plant in a pot with a soil and organic matter (compost or peat moss) mixture and good drainage.'
    @water_needs = "Keep soil lightly damp but don't overwater to avoid root rot."
  end
end
