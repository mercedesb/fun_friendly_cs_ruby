# frozen_string_literal: true

class Inheritance::PlantController < ApplicationController
  def index
    @progress = "You haven't picked your garden type yet :("
  end

  def learn
    if !plant_params.key?(:light_needs) || !plant_params.key?(:water_needs)
      flash[:error] = '⚠️ Oops! You have to tell me about your garden'
      render :index
      return
    end

    plants = [Inheritance::Geranium.new, Inheritance::Coleus.new, Inheritance::Begonia.new]
    matching_plants = plants.select { |p| p.send(plant_params[:light_needs]) && p.send(plant_params[:water_needs]) }
    if matching_plants.empty?
      @progress = 'Uh oh, no matching plants'
    else
      plant_instructions_list = matching_plants.map { |p| "<li>#{p.learn_how_to_garden}</li>" }.join
      @progress = "<ul>#{plant_instructions_list}</ul>"
    end

    render :index
  end

  private

  def plant_params
    params.permit(:light_needs, :water_needs, :commit)
  end
end
