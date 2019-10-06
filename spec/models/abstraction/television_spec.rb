# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Abstraction::Television do
  let(:television) { Abstraction::Television.create }

  it 'has a valid constructor' do
    expect(television).to be_kind_of(Abstraction::Television)
  end

  it 'allows user to call power method' do
    infrared_light = { light_data: { button: Abstraction::RemoteControl::Button::POWER } }
    expect(television.handle_remote_control_click(infrared_light)).to match(/The TV is on and the volume is set to 0./i)
  end

  it 'does not give user access to any internal methods' do
    expect { television.convert_infrared_light_to_binary }.to raise_error(NoMethodError)
    expect { television.decode_binary_data }.to raise_error(NoMethodError)
    expect { television.change_television_state }.to raise_error(NoMethodError)
    expect { television.display_state_change_to_user }.to raise_error(NoMethodError)
  end
end
