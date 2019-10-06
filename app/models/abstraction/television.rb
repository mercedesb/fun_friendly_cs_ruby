# frozen_string_literal: true

class Abstraction::Television < ApplicationRecord
  has_many :remote_controls

  def handle_remote_control_click(infrared_light)
    binary_data = convert_infrared_light_to_binary(infrared_light)
    decoded_data = decode_binary_data(binary_data)
    change_television_state(decoded_data)
  end

  private

  def convert_infrared_light_to_binary(infrared_light)
    puts 'Converting infrared light to binary'
    infrared_light[:light_data]
  end

  def decode_binary_data(binary_data)
    puts 'Decoding binary data'
    # assume we did some decoding here
    binary_data
  end

  def change_television_state(data)
    puts 'Assume the TV microprocessor here is taking care of its magic'
    if data[:button] == Abstraction::RemoteControl::Button::POWER
      new_power = !power
    elsif data[:button] == Abstraction::RemoteControl::Button::VOLUME_UP
      new_volume = volume + 1
    elsif data[:button] == Abstraction::RemoteControl::Button::VOLUME_DOWN && volume.positive?
      new_volume = volume - 1
    end
    update(power: new_power.nil? ? power : new_power, volume: new_volume || volume)
    display_state_change_to_user
  end

  def display_state_change_to_user
    if !power
      'The TV is off.'
    else
      "The TV is on and the volume is set to #{volume}."
    end
  end
end
