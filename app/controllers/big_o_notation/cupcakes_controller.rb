# frozen_string_literal: true

class BigONotation::CupcakesController < ApplicationController
  def index
    @batches = rand(10)
    @progress = "You haven't started baking yet :("
  end

  def preheat_oven
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.preheat_oven(bake_params[:batches].to_i)
    render :index
  end

  def combine_butter_and_sugar
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.combine_butter_and_sugar(bake_params[:batches].to_i)
    render :index
  end

  def add_eggs
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.add_eggs(bake_params[:batches].to_i)
    render :index
  end

  def combine_flour_and_baking_powder
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.combine_flour_and_baking_powder(bake_params[:batches].to_i)
    render :index
  end

  def combine_milk_flour_and_butter_mixture
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.combine_flour_mixture_and_milk_and_butter_mixture(bake_params[:batches].to_i)
    render :index
  end

  def bake
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.bake
    render :index
  end

  def frost
    @batches = bake_params[:batches]
    @progress = BigONotation::Cupcakes.new.fibonacci_frosting(bake_params[:batches].to_i)
    render :index
  end

  private

  def bake_params
    params.permit(:batches)
  end
end
