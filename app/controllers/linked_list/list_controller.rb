# frozen_string_literal: true

class LinkedList::ListController < ApplicationController
  def index
    @progress = if LinkedList::List.all.empty?
                  'No clues yet :('
                else
                  render_list(LinkedList::List.all.order(:created_at).last)
                end
  end

  def create
    list = LinkedList::List.all.empty? ? LinkedList::List.create : LinkedList::List.all.order(:created_at).last
    list.add(create_params[:add])

    @progress = render_list(list)
    render :index
  end

  def delete
    list = LinkedList::List.all.order(:created_at).last
    if list.nil? || list.head.nil?
      flash[:error] = '⚠️ Oops! Nothing to delete'
    else
      list.remove
    end

    @progress = render_list(list)
    render :index
  end

  private

  def render_list(list)
    template = '<ul>'

    clue = list.head
    until clue.nil?
      template += "<li>#{clue.data}</li>"
      clue = clue.next
    end
    template += '</ul>'

    template
  end

  def create_params
    params.permit(:add, :commit)
  end

  def delete_params
    params.permit(:commit)
  end
end
