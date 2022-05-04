# frozen_string_literal: true

class UserDelete
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(event)
    uid = event.data[:uid]

    user = @repository.find(UserUid.new(uid))

    @repository.delete(user.uid)
  end
end
