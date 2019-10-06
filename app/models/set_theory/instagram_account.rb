# frozen_string_literal: true

class SetTheory::InstagramAccount < ApplicationRecord
  validates_presence_of :account_handle
  validates_length_of :account_handle, maximum: 30
end
