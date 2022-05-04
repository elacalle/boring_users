# frozen_string_literal: true

class UpdateUserCommand < ActiveEventStore::Event
  attributes :uid, :first_name, :last_name, :phone_number
end
