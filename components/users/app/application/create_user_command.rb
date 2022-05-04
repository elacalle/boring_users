# frozen_string_literal: true

class CreateUserCommand < ActiveEventStore::Event
  attributes :uid, :first_name, :last_name, :email, :phone_number
end
