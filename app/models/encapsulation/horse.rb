# frozen_string_literal: true

class Encapsulation::Horse
  module LegPosition
    UP = 'up'
    DOWN = 'down'
  end

  attr_reader :front_left_leg_position, :front_right_leg_position, :back_left_leg_position, :back_right_leg_position

  def initialize
    stand
  end

  def stand
    @front_left_leg_position = LegPosition::DOWN
    @front_right_leg_position = LegPosition::DOWN
    @back_left_leg_position = LegPosition::DOWN
    @back_right_leg_position = LegPosition::DOWN
  end

  def walk(steps)
    time = 0
    distance_traveled = 0

    steps.times do
      @back_left_leg_position = LegPosition::UP
      @back_left_leg_position = LegPosition::DOWN

      @front_left_leg_position = LegPosition::UP
      @front_left_leg_position = LegPosition::DOWN

      @back_right_leg_position = LegPosition::UP
      @back_right_leg_position = LegPosition::DOWN

      @front_right_leg_position = LegPosition::UP
      @front_right_leg_position = LegPosition::DOWN

      time += 1; # 1 step / second
      distance_traveled += 6; # 6 ft / sec
    end

    { steps: steps, time: time, distance_traveled: distance_traveled }
  end

  # 10 mph
  def trot(steps)
    time = 0
    distance_traveled = 0

    steps.times do
      @back_left_leg_position = LegPosition::UP
      @front_right_leg_position = LegPosition::UP
      @back_left_leg_position = LegPosition::DOWN
      @front_right_leg_position = LegPosition::DOWN

      @back_right_leg_position = LegPosition::UP
      @front_left_leg_position = LegPosition::UP
      @back_right_leg_position = LegPosition::DOWN
      @front_left_leg_position = LegPosition::DOWN

      time += 0.4; # 2.5 steps / second
      distance_traveled += 5.87; # 14.667 ft / sec
    end

    { steps: steps, time: time, distance_traveled: distance_traveled }
  end

  # 15 mph
  def canter(steps)
    time = 0
    distance_traveled = 0

    steps.times do
      @back_left_leg_position = LegPosition::UP
      @back_left_leg_position = LegPosition::DOWN

      @back_right_leg_position = LegPosition::UP
      @front_left_leg_position = LegPosition::UP
      @back_right_leg_position = LegPosition::DOWN
      @front_left_leg_position = LegPosition::DOWN

      @front_right_leg_position = LegPosition::UP
      @front_right_leg_position = LegPosition::DOWN

      time += 0.27; # 3.667 steps / second
      distance_traveled += 6; # 22 ft / second
    end

    { steps: steps, time: time, distance_traveled: distance_traveled }
  end

  # 25 mph
  def gallop(steps)
    time = 0
    distance_traveled = 0

    steps.times do
      @back_left_leg_position = LegPosition::UP
      @back_left_leg_position = LegPosition::DOWN

      @back_right_leg_position = LegPosition::UP
      @back_right_leg_position = LegPosition::DOWN

      @front_left_leg_position = LegPosition::UP
      @front_left_leg_position = LegPosition::DOWN

      @front_right_leg_position = LegPosition::UP
      @front_right_leg_position = LegPosition::DOWN

      time += 0.167; # 6 steps / second
      distance_traveled += 6.11; # 36.667 ft / second
    end

    { steps: steps, time: time, distance_traveled: distance_traveled }
  end
end
