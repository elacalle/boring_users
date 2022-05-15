# frozen_string_literal: true

class UserDelete
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call(parameters)
    user = @repository.find(parameters[:uid])

    @repository.delete(user.uid)
  end
end
