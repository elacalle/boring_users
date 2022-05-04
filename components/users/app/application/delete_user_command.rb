# frozen_string_literal: true

class DeleteUserCommand < ActiveEventStore::Event
  attributes :uid
end
