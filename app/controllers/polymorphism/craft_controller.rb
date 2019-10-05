# frozen_string_literal: true

class Polymorphism::CraftController < ApplicationController
  def index
    @progress = "You haven't created anything yet :("
  end

  def create
    unless craft_params.key?(:craft)
      flash[:error] = '⚠️ Oops! Pick a craft'
      render :index
      return
    end

    yarn_craft = if craft_params[:craft] == 'knit'
                   Polymorphism::Knitting
                 elsif craft_params[:craft] == 'crochet'
                   Polymorphism::Crocheting
                 elsif craft_params[:craft] == 'weave'
                   Polymorphism::Weaving
                 end

    chosen_craft = yarn_craft.new(craft_params[:row_length].to_i)
    fabric = chosen_craft.create_fabric(craft_params[:number_of_rows].to_i)
    @progress = fabric.join('<br/>')

    render :index
  end

  private

  def craft_params
    params.permit(:craft, :row_length, :number_of_rows, :commit)
  end
end
