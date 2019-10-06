# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinkedList::Node do
  let(:node) { LinkedList::Node.create(data: 'hi') }

  it 'has a valid constructor' do
    expect(node).to be_kind_of(LinkedList::Node)
  end

  it 'has a data property' do
    expect(node).to respond_to(:data)
    expect(node.data).to eq('hi')
  end

  it 'has a next property' do
    expect(node).to respond_to(:next)
    expect(node.next).to be_nil
  end
end
