# frozen_string_literal: true

class UserUpdater
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  # rubocop:disable Metrics/AbcSize
  def call(event)
    data = event.data

    user = @repository.find(UserUid.new(data[:uid]))

    user.assign(
      uid: UserUid.new(user.uid.value),
      first_name: UserFirstName.new(data[:first_name]),
      last_name: UserLastName.new(data[:last_name]),
      email: UserEmail.new(user.email.value),
      phone_number: UserPhoneNumber.new(data[:phone_number])
    )

    @repository.update(user)
  end
  # rubocop:enable Metrics/AbcSize
end
