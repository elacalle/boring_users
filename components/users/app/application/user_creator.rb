# frozen_string_literal: true

class UserCreator
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(parameters)
    user = UserAggregate.new(parameters)

    @repository.create(user)
  end
end
