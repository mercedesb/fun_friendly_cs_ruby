# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tree::Tree do
  let(:tree) { Tree::Tree.new }
  let(:success_criteria) do
    proc do |node|
      JSON.parse(node.data).symbolize_keys[:success]
    end
  end
  let(:get_search_path) do
    proc do |node|
      JSON.parse(node.data).symbolize_keys[:name]
    end
  end

  it 'has a valid constructor' do
    expect(tree).to be_kind_of(Tree::Tree)
  end

  describe 'search methods' do
    let!(:tree) { Tree::Tree.create }

    before do
      root = Tree::Node.create(data: { name: 'root' }.to_json)
      one = Tree::Node.create(data: { name: '1' }.to_json)
      two = Tree::Node.create(data: { name: '2' }.to_json)
      root.add_child(one)
      root.add_child(two)

      three = Tree::Node.create(data: { name: '3' }.to_json)
      four = Tree::Node.create(data: { name: '4' }.to_json)
      five = Tree::Node.create(data: { name: '5' }.to_json)
      six = Tree::Node.create(data: { name: '6' }.to_json)
      one.add_child(three)
      one.add_child(four)
      two.add_child(five)
      two.add_child(six)

      seven = Tree::Node.create(data: { name: '7' }.to_json)
      eight = Tree::Node.create(data: { name: '8' }.to_json)
      nine = Tree::Node.create(data: { name: '9', success: true }.to_json)
      ten = Tree::Node.create(data: { name: '10' }.to_json)
      eleven = Tree::Node.create(data: { name: '11' }.to_json)
      twelve = Tree::Node.create(data: { name: '12' }.to_json)
      thirteen = Tree::Node.create(data: { name: '13' }.to_json)
      fourteen = Tree::Node.create(data: { name: '14' }.to_json)
      three.add_child(seven)
      three.add_child(eight)
      four.add_child(nine)
      four.add_child(ten)
      five.add_child(eleven)
      five.add_child(twelve)
      six.add_child(thirteen)
      six.add_child(fourteen)
      tree.update(root: root)
    end

    describe 'BFS' do
      let(:expected_path) do
        [
          'root',
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
          '9',
          'Success!'
        ]
      end

      describe 'iterative_breadth_first_search' do
        it 'finds and returns the correct node' do
          search_path = tree.iterative_breadth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.pop).to eq('Success!')
          expect(search_path.pop).to eq('9')
          expect(Queues::Queue.count).to eq(0)
        end

        it 'searches breadth first' do
          search_path = tree.iterative_breadth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.length).to eq(expected_path.length)

          search_path.length.times do |i|
            expect(search_path[i]).to eq(expected_path[i])
          end

          expect(Queues::Queue.count).to eq(0)
        end
      end

      describe 'recursive_breadth_first_search' do
        it 'finds and returns the correct node' do
          search_path = tree.recursive_breadth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.pop).to eq('Success!')
          expect(search_path.pop).to eq('9')
          expect(Queues::Queue.count).to eq(0)
        end

        it 'searches breadth first' do
          search_path = tree.recursive_breadth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.length).to eq(expected_path.length)

          search_path.length.times do |i|
            expect(search_path[i]).to eq(expected_path[i])
          end

          expect(Queues::Queue.count).to eq(0)
        end
      end
    end

    describe 'DFS' do
      let!(:expected_path) do
        [
          'root',
          '2',
          '6',
          '14',
          '13',
          '5',
          '12',
          '11',
          '1',
          '4',
          '10',
          '9',
          'Success!'
        ]
      end

      describe 'iterative_depth_first_search' do
        it 'finds and returns the correct node' do
          search_path = tree.iterative_depth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.pop).to eq('Success!')
          expect(search_path.pop).to eq('9')
          expect(Stack::Stack.count).to eq(0)
        end

        it 'searches depth first' do
          search_path = tree.iterative_depth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.length).to eq(expected_path.length)

          search_path.length.times do |i|
            expect(search_path[i]).to eq(expected_path[i])
          end

          expect(Stack::Stack.count).to eq(0)
        end
      end

      describe 'recursive_depth_first_search' do
        it 'finds and returns the correct node' do
          search_path = tree.recursive_depth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.pop).to eq('Success!')
          expect(search_path.pop).to eq('9')
          expect(Stack::Stack.count).to eq(0)
        end

        it 'searches depth first' do
          search_path = tree.recursive_depth_first_search(
            tree.root,
            get_search_path,
            success_criteria
          )
          expect(search_path.length).to eq(expected_path.length)

          search_path.length.times do |i|
            expect(search_path[i]).to eq(expected_path[i])
          end

          expect(Stack::Stack.count).to eq(0)
        end
      end
    end
  end
end
