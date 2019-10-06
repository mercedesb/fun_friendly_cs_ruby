# frozen_string_literal: true

class Stack::StackController < ApplicationController
  def index
    @progress = if Stack::Stack.all.empty?
                  'No candy yet :('
                else
                  render_stack(Stack::Stack.all.order(:created_at).last)
                end
  end

  def create
    pez_dispenser = Stack::Stack.all.empty? ? Stack::Stack.create : Stack::Stack.all.order(:created_at).last
    pez_dispenser.push("PEZ #{DateTime.current}")
    @progress = render_stack(pez_dispenser)
    render :index
  end

  def delete
    pez_dispenser = Stack::Stack.all.order(:created_at).last
    if pez_dispenser.nil? || pez_dispenser.head.nil?
      flash[:error] = '⚠️ Oops! Nothing to delete'
    else
      pez_dispenser.pop
    end

    @progress = render_stack(pez_dispenser)
    render :index
  end

  private

  def render_stack(stack)
    template = '<ul>'

    node = stack.head
    until node.nil?
      template += "<li>#{node.data}</li>"
      node = node.next
    end
    template += '</ul>'

    template
  end
end
