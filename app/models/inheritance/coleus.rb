# frozen_string_literal: true

class Inheritance::Coleus < Inheritance::Plant
  def initialize
    @name = 'Coleus'
    @sun = true
    @wet = true
    @light_needs = 'Partial sun.'
    @soil_needs = 'Plant in fertile, well draining soil in a pot or the ground.'
    @water_needs = 'Keep soil moist as much as possible.'
  end
end
