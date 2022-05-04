# frozen_string_literal: true

class UserPhoneNumber
  attr_reader :value

  def initialize(value)
    raise ArgumentError, 'Empty value' if value.nil?
    raise ArgumentError, 'Invalid length' if value.length != 9

    @value = value
  end
end
