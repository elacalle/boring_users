# frozen_string_literal: true

class UserFinder
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(uid)
    user = @repository.find(UserUid.new(uid))

    raise UserNotFound, "Unable to find User uid #{uid}" if user.nil?

    UserResponseMapper.new.call(user)
  end
end
