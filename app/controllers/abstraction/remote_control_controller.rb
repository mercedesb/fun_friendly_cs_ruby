# frozen_string_literal: true

class Abstraction::RemoteControlController < ApplicationController
  def index
    tv = Abstraction::Television.first || Abstraction::Television.create
    remote = Abstraction::RemoteControl.first || Abstraction::RemoteControl.create(television: tv)
    @remote_id = remote.id
    @progress = 'The TV is off.'
  end

  def click_button
    @remote_id = remote_params[:remote_id].to_i
    remote = Abstraction::RemoteControl.find(@remote_id)
    @progress = if remote_params[:commit] == 'Power'
                  remote.power
                elsif remote_params[:commit] == 'Volume Up'
                  remote.turn_up_volume
                elsif remote_params[:commit] == 'Volume Down'
                  remote.turn_down_volume
                end

    render :index
  end

  private

  def remote_params
    params.permit(:commit, :remote_id)
  end
end
