# frozen_string_literal: true

class SetTheory::InstagramAccountController < ApplicationController
  def index
    @progress = if SetTheory::InstagramAccount.all.empty?
                  "You haven't created anything yet :("
                else
                  "#{dogs}#{cats}"
                end
  end

  def create
    dog = ActiveModel::Type::Boolean.new.cast(account_params[:animal_type_dog])
    cat = ActiveModel::Type::Boolean.new.cast(account_params[:animal_type_cat])
    SetTheory::InstagramAccount.create(account_handle: account_params[:account_handle], dog: dog, cat: cat)
    @progress = "#{dogs}#{cats}"
    render :index
  end

  def intersection
    header = 'Cute accounts that have both cats and dogs!'
    intersection = SetTheory::InstagramAccount.where(dog: true, cat: true)
    render_set(header, intersection)
  end

  def union
    header = 'All the cute accounts!'
    union = SetTheory::InstagramAccount.all
    render_set(header, union)
  end

  def difference
    header = 'Cute accounts that have only dogs (no cats allowed)!'
    difference = SetTheory::InstagramAccount.where(dog: true, cat: false)
    render_set(header, difference)
  end

  def relative_complement
    header = 'Cute accounts that have only cats (no dogs allowed)!'
    complement = SetTheory::InstagramAccount.where(dog: false, cat: true)
    render_set(header, complement)
  end

  def symmetric_difference
    header = 'Cute accounts that have only one type of animal (no cross-species friendships here)!'
    symmetric_difference = SetTheory::InstagramAccount.where(dog: true, cat: false).or(SetTheory::InstagramAccount.where(dog: false, cat: true))
    render_set(header, symmetric_difference)
  end

  private

  def render_set(header, set)
    @progress = if SetTheory::InstagramAccount.all.empty?
                  "You haven't created anything yet :("
                else
                  "#{dogs}#{cats}#{set(header, set)}"
                end
    render :index
  end

  def dogs
    dog_set = SetTheory::InstagramAccount.where(dog: true)
    set('Cute Instagram Dogs', dog_set)
  end

  def cats
    cat_set = SetTheory::InstagramAccount.where(cat: true)
    set('Cute Instagram Cats', cat_set)
  end

  def set(header, calculated_set)
    template = "<div class='Set'><h3>#{header}</h3><ul>"
    template += calculated_set.map { |a| "<li>#{a.account_handle}</li>" }.join
    template += '</ul></div>'
    template
  end

  def account_params
    params.permit(:account_handle, :animal_type_dog, :animal_type_cat, :commit)
  end
end
