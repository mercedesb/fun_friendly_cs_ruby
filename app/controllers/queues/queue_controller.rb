# frozen_string_literal: true

class Queues::QueueController < ApplicationController
  def index
    @progress = if Queues::Queue.all.empty?
                  'Nobody wants to speak yet :('
                else
                  render_queue(Queues::Queue.all.order(:created_at).last)
                end
  end

  def create
    bof_line = Queues::Queue.all.empty? ? Queues::Queue.create : Queues::Queue.all.order(:created_at).last
    bof_line.enqueue("Person #{DateTime.current}")
    @progress = render_queue(bof_line)
    render :index
  end

  def delete
    bof_line = Queues::Queue.all.order(:created_at).last
    if bof_line.nil? || bof_line.head.nil?
      flash[:error] = '⚠️ Oops! Nothing to delete'
    else
      bof_line.dequeue
    end

    @progress = render_queue(bof_line)
    render :index
  end

  private

  def render_queue(queue)
    template = '<ul>'

    node = queue.head
    until node.nil?
      template += "<li>#{node.data}</li>"
      node = node.next
    end
    template += '</ul>'

    template
  end
end
