# frozen_string_literal: true

class Abstraction::RemoteControl < ApplicationRecord
  module Button
    POWER = 'power'
    VOLUME_UP = 'up'
    VOLUME_DOWN = 'down'
  end

  belongs_to :television

  def power
    handle_button_click(Button::POWER)
  end

  def turn_up_volume
    handle_button_click(Button::VOLUME_UP)
  end

  def turn_down_volume
    handle_button_click(Button::VOLUME_DOWN)
  end

  private

  def handle_button_click(button)
    encoded_data = encode_button_press_into_binary(button)
    send_binary_data_as_infrared_light(encoded_data)
  end

  def encode_button_press_into_binary(button)
    puts 'Assume the button data is encoded into binary'
    { button: button }
  end

  def send_binary_data_as_infrared_light(binary_data)
    infrared_light = convert_binary_to_infrared_light(binary_data)
    puts 'Sending infrared light signal'
    television.handle_remote_control_click(infrared_light)
  end

  def convert_binary_to_infrared_light(binary_data)
    puts 'Converting binary data into infrared light'
    { light_data: binary_data }
  end
end
