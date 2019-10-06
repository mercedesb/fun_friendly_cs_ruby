# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stack::Stack do
  let(:stack) { Stack::Stack.new }

  it 'has a valid constructor' do
    expect(stack).to be_kind_of(Stack::Stack)
  end

  it 'has a head property' do
    expect(stack).to respond_to(:head)
    expect(stack.head).to be_nil
  end

  describe 'push' do
    describe 'when the list is empty' do
      it 'adds a node as the head of the list' do
        stack.push('3')
        expect(stack.head).to be_kind_of(LinkedList::Node)
      end
    end

    describe 'when the list is not empty' do
      it 'adds a node as the head of the list' do
        stack.push('3')
        stack.push('7')
        expect(stack.head).to be_kind_of(LinkedList::Node)
        expect(stack.head.data).to eq('7')
        expect(stack.head.next).to be_kind_of(LinkedList::Node)
        expect(stack.head.next.data).to eq('3')
      end
    end

    it 'creates a LinkedList::Node with the correct data' do
      stack.push('dog')
      expect(stack.head).to be_kind_of(LinkedList::Node)
      expect(stack.head.data).to eq('dog')
    end
  end

  describe 'pop' do
    before do
      stack.push('3')
      stack.push('7')
      stack.push('1')
    end

    it 'updates head to the following node' do
      stack.pop
      expect(stack.head.data).to eq('7')
    end

    it 'returns the correct node' do
      node = stack.pop
      expect(node).to be_kind_of(LinkedList::Node)
      expect(node.data).to eq('1')
    end
  end

  describe 'insert' do
    before do
      stack.add('3')
      stack.add('7')
      stack.add('1')
    end

    describe 'when the index is less than 0' do
      it 'returns undefined' do
        node = stack.insert('new data', -1)
        expect(node).to be_nil
      end
    end

    describe 'when the index is 0' do
      it 'updates the head to be the new node' do
        initial_head = stack.head
        stack.insert('new data', 0)
        expect(stack.head).to be_kind_of(LinkedList::Node)
        expect(stack.head.data).to eq('new data')
        expect(stack.head.next).to eq(initial_head)
      end

      it 'returns the correct node' do
        node = stack.insert('new data', 0)
        expect(node).to be_kind_of(LinkedList::Node)
        expect(node.data).to eq('new data')
      end
    end

    describe 'when the index is greater than 0' do
      it 'throws an error' do
        expect { stack.insert('new data', 1) }.to raise_error(RuntimeError)
      end
    end
  end
end
