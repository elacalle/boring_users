# frozen_string_literal: true

class UpdateUserHandler
  def initialize(service = UserUpdater.new)
    @service = service
  end

  def call(event)
    data = event.data

    @service.call(
      uid: UserUid.new(data[:uid]),
      first_name: UserFirstName.new(data[:first_name]),
      last_name: UserLastName.new(data[:last_name]),
      phone_number: UserPhoneNumber.new(data[:phone_number])
    )
  end
end
