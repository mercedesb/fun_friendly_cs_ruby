# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Abstraction::RemoteControl do
  let(:television) { Abstraction::Television.create }
  let(:remote) { Abstraction::RemoteControl.create(television: television) }

  it 'has a valid constructor' do
    expect(remote).to be_kind_of(Abstraction::RemoteControl)
  end

  it 'allows user to call power method' do
    expect(remote.power).to match(/The TV is on and the volume is set to 0./i)
  end

  it 'allows user to call turn volume up method' do
    expect(remote.turn_up_volume).to match(/The TV is off./i)
  end

  it 'allows user to call turn volume down method' do
    expect(remote.turn_down_volume).to match(/The TV is off./i)
  end

  it 'does not give user access to any internal methods' do
    expect { remote.handle_button_click }.to raise_error(NoMethodError)
    expect { remote.encode_button_press_into_binary }.to raise_error(NoMethodError)
    expect { remote.send_binary_data_as_infrared_light }.to raise_error(NoMethodError)
    expect { remote.convert_binary_to_infrared_light }.to raise_error(NoMethodError)
  end
end
