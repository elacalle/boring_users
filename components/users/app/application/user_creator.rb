# frozen_string_literal: true

class UserCreator
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(event)
    data = event.data

    user = UserAggregate.new(
      uid: UserUid.new(data[:uid]),
      first_name: UserFirstName.new(data[:first_name]),
      last_name: UserLastName.new(data[:last_name]),
      email: UserEmail.new(data[:email]),
      phone_number: UserPhoneNumber.new(data[:phone_number])
    )

    @repository.create(user)
  end
end
