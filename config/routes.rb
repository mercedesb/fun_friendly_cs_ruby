# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :big_o_notation do
    get '/cupcakes', to: 'cupcakes#index'
    get 'cupcakes/index'
    get 'cupcakes/preheat_oven'
    get 'cupcakes/combine_butter_and_sugar'
    get 'cupcakes/add_eggs'
    get 'cupcakes/combine_flour_and_baking_powder'
    get 'cupcakes/combine_milk_flour_and_butter_mixture'
    get 'cupcakes/bake'
    get 'cupcakes/frost'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'big_o_notation/cupcakes#index'
end
