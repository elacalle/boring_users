# frozen_string_literal: true

class UserUid
  attr_reader :value

  def initialize(value)
    raise ArgumentError, 'Empty value' if value.nil?

    @value = value
  end
end
