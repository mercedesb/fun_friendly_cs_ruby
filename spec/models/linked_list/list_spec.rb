# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkedList::List do
  let(:list) { LinkedList::List.new }

  it 'has a valid constructor' do
    expect(list).to be_kind_of(LinkedList::List)
  end

  it 'has a head property' do
    expect(list).to respond_to(:head)
    expect(list.head).to be_nil
  end

  it 'has a tail property' do
    expect(list).to respond_to(:tail)
    expect(list.tail).to be_nil
  end

  describe 'add' do
    describe 'when the list is empty' do
      it 'adds a node as the head and tail of the list' do
        list.add('3')
        expect(list.head).to be_kind_of(LinkedList::Node)
        expect(list.head.data).to eq('3')
        expect(list.tail).to be_kind_of(LinkedList::Node)
        expect(list.tail.data).to eq('3')
        expect(list.head).to eq(list.tail)
      end
    end

    describe 'when the list is not empty' do
      it 'adds a node to the end of the list' do
        list.add('3')
        list.add('7')
        expect(list.tail).to be_kind_of(LinkedList::Node)
        expect(list.tail.data).to eq('7')
        expect(list.head).to_not eq(list.tail)
      end
    end

    it 'creates a LinkedList::Node with the correct data' do
      list.add('dog')
      expect(list.head).to be_kind_of(LinkedList::Node)
      expect(list.head.data).to eq('dog')
    end
  end

  describe 'remove_head' do
    describe 'when the head is not nil' do
      before do
        list.add('3')
        list.add('6')
        list.add('7')
        list.add('1')
      end

      it 'updates head to the following node' do
        list.remove_head
        expect(list.head.data).to eq('6')
      end

      it 'returns the correct node' do
        node = list.remove_head
        expect(node).to be_kind_of(LinkedList::Node)
        expect(node.data).to eq('3')
      end
    end

    describe 'when the head is nil' do
      it 'returns nil' do
        expect(list.remove_head).to be_nil
      end
    end
  end

  describe 'remove_tail' do
    describe 'when the tail is not nil' do
      before do
        list.add('3')
        list.add('6')
        list.add('7')
        list.add('1')
      end

      it 'updates tail to the previous node' do
        list.remove_tail
        expect(list.tail.data).to eq('7')
      end

      it 'returns the correct node' do
        node = list.remove_tail
        expect(node).to be_kind_of(LinkedList::Node)
        expect(node.data).to eq('1')
      end
    end

    describe 'when the tail is nil' do
      it 'returns nil' do
        expect(list.remove_tail).to be_nil
      end
    end
  end

  describe 'insert' do
    before do
      list.add('3')
      list.add('7')
      list.add('1')
    end

    describe 'when the index is less than 0' do
      it 'returns nil' do
        node = list.insert('new data', -1)
        expect(node).to be_nil
      end
    end

    describe 'when the index is 0' do
      it 'updates the head to be the new node' do
        initial_head = list.head
        list.insert('new data', 0)
        expect(list.head).to be_kind_of(LinkedList::Node)
        expect(list.head.data).to eq('new data')
        expect(list.head.next).to eq(initial_head)
      end

      it 'returns the correct node' do
        node = list.insert('new data', 0)
        expect(node).to be_kind_of(LinkedList::Node)
        expect(node.data).to eq('new data')
      end
    end

    describe 'when the index is greater than 0' do
      describe 'and the index is in the middle of the list' do
        it 'updates the next pointer of the previous node to the inserted node' do
          initial_head = list.head
          list.insert('new data', 1)
          inserted_node = list.head.next
          expect(inserted_node.data).to eq('new data')
          expect(initial_head.next).to eq(inserted_node)
        end

        it 'sets the next pointer of the inserted node to the node that was at that position' do
          initial_node = list.head.next
          list.insert('new data', 1)
          inserted_node = list.head.next
          expect(inserted_node.data).to eq('new data')
          expect(inserted_node.next).to eq(initial_node)
        end
      end

      describe 'and the index is at the end of the list' do
        it 'updates the next pointer of the previous tail node to the inserted node' do
          initial_tail = list.tail
          list.insert('new data', 3)
          inserted_node = list.head.next.next.next
          expect(inserted_node.data).to eq('new data')
          expect(initial_tail.next).to eq(inserted_node)
        end

        it 'updates the tail node to the inserted node' do
          list.insert('new data', 3)
          inserted_node = list.head.next.next.next
          expect(inserted_node.data).to eq('new data')
          expect(list.tail).to eq(inserted_node)
        end
      end
    end
  end
end
