# frozen_string_literal: true

class UserUpdater
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(parameters)
    user = @repository.find(parameters[:uid])

    user.assign(
      uid: UserUid.new(user.uid.value),
      first_name: parameters[:first_name],
      last_name: parameters[:last_name],
      email: UserEmail.new(user.email.value),
      phone_number: parameters[:phone_number]
    )

    @repository.update(user)
  end
end
