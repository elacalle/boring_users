# frozen_string_literal: true

class CreateUserHandler
  def initialize(service = UserCreator.new)
    @service = service
  end

  def call(event)
    data = event.data

    @service.call(
      uid: UserUid.new(data[:uid]),
      first_name: UserFirstName.new(data[:first_name]),
      last_name: UserLastName.new(data[:last_name]),
      email: UserEmail.new(data[:email]),
      phone_number: UserPhoneNumber.new(data[:phone_number])
    )
  end
end
