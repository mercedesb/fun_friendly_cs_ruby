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

  namespace :set_theory do
    get '/instagram_account', to: 'instagram_account#index'
    get 'instagram_account/index'
    post 'instagram_account/create'
    get 'instagram_account/intersection'
    get 'instagram_account/union'
    get 'instagram_account/difference'
    get 'instagram_account/relative_complement'
    get 'instagram_account/symmetric_difference'
  end

  namespace :recursion do
    get '/nesting_doll_collection', to: 'nesting_doll_collection#index'
    get 'nesting_doll_collection/index'
    get 'nesting_doll_collection/count'
  end

  namespace :linked_list do
    get '/list', to: 'list#index'
    get 'list/index'
    post 'list/create'
    delete 'list/delete'
  end

  namespace :stack do
    get '/stack', to: 'stack#index'
    get 'stack/index'
    post 'stack/create'
    delete 'stack/delete'
  end

  namespace :queues do
    get '/queue', to: 'queue#index'
    get 'queue/index'
    post 'queue/create'
    delete 'queue/delete'
  end

  namespace :tree do
    get '/tree', to: 'tree#index'
    get 'tree/index'
    get 'tree/harry_worst_iterative'
    get 'tree/harry_worst_recursive'
    get 'tree/harry_best_iterative'
    get 'tree/harry_best_recursive'
    get 'tree/cedric_worst_iterative'
    get 'tree/cedric_worst_recursive'
    get 'tree/cedric_best_iterative'
    get 'tree/cedric_best_recursive'
  end

  namespace :encapsulation do
    get '/horse', to: 'horse#index'
    get 'horse/index'
    get 'horse/move'
  end

  namespace :abstraction do
    get '/remote_control', to: 'remote_control#index'
    get 'remote_control/index'
    get 'remote_control/click_button'
  end

  namespace :inheritance do
    get '/plant', to: 'plant#index'
    get 'plant/index'
    get 'plant/learn'
  end

  namespace :polymorphism do
    get '/craft', to: 'craft#index'
    get 'craft/index'
    get 'craft/create'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'big_o_notation/cupcakes#index'
end
