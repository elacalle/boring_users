# frozen_string_literal: true

class UserSearchAll
  def initialize(repository = ::UserRepository.new)
    @repository = repository
  end

  def call
    users = @repository.search_all

    users.map(&:to_h)
  end
end
