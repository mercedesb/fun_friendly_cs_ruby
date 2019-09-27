# frozen_string_literal: true

class Encapsulation::HorseController < ApplicationController
  def index
    @progress = "Your horse hasn't moved yet :("
  end

  def move
    giddy_up = Encapsulation::Horse.new
    number_of_steps = move_params[:steps].to_i

    result = if move_params[:commit] == 'Walk'
               giddy_up.walk(number_of_steps)
             elsif move_params[:commit] == 'Trot'
               giddy_up.trot(number_of_steps)
             elsif move_params[:commit] == 'Canter'
               giddy_up.canter(number_of_steps)
             elsif move_params[:commit] == 'Gallop'
               giddy_up.gallop(number_of_steps)
             end

    @progress = "Your horse moved #{result[:steps]} steps in #{result[:time]} seconds and traveled #{result[:distance_traveled]} feet"
    render :index
  end

  private

  def move_params
    params.permit(:steps, :commit)
  end
end
