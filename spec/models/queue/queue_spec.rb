# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queues::Queue do
  let(:queue) { Queues::Queue.new }

  it 'has a valid constructor' do
    expect(queue).to be_kind_of(Queues::Queue)
  end

  it 'has a head property' do
    expect(queue).to respond_to(:head)
    expect(queue.head).to be_nil
  end

  it 'has a tail property' do
    expect(queue).to respond_to(:tail)
    expect(queue.tail).to be_nil
  end

  describe 'enqueue' do
    describe 'when the queue is empty' do
      it 'adds a node as the head and tail of the queue' do
        queue.add('3')
        expect(queue.head).to be_kind_of(LinkedList::Node)
        expect(queue.head.data).to eq('3')
        expect(queue.tail).to be_kind_of(LinkedList::Node)
        expect(queue.tail.data).to eq('3')
      end
    end

    describe 'when the queue is not empty' do
      it 'adds a node as the tail of the queue' do
        queue.add('3')
        queue.add('7')
        expect(queue.head).to be_kind_of(LinkedList::Node)
        expect(queue.head.data).to eq('3')
        expect(queue.head.next).to be_kind_of(LinkedList::Node)
        expect(queue.head.next.data).to eq('7')
        expect(queue.tail).to be_kind_of(LinkedList::Node)
        expect(queue.tail.data).to eq('7')
      end
    end

    it 'creates a LinkedList::Node with the correct data' do
      queue.enqueue('dog')
      expect(queue.head).to be_kind_of(LinkedList::Node)
      expect(queue.head.data).to eq('dog')
    end
  end

  describe 'dequeue' do
    before do
      queue.enqueue('3')
      queue.enqueue('7')
      queue.enqueue('1')
    end

    it 'updates head to the following node' do
      queue.dequeue
      expect(queue.head.data).to eq('7')
    end

    it 'returns the correct node' do
      node = queue.dequeue
      expect(node).to be_kind_of(LinkedList::Node)
      expect(node.data).to eq('3')
    end
  end

  describe 'insert' do
    before do
      queue.enqueue('3')
      queue.enqueue('7')
      queue.enqueue('1')
    end

    it 'throws an error' do
      expect { queue.insert('new data', 1) }.to raise_error(RuntimeError)
    end
  end
end
