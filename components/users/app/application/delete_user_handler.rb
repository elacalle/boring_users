# frozen_string_literal: true

class DeleteUserHandler
  def initialize(service = UserDelete.new)
    @service = service
  end

  def call(event)
    data = event.data

    @service.call(uid: UserUid.new(data[:uid]))
  end
end
