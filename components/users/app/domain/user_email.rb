# frozen_string_literal: true

class UserEmail
  attr_reader :value

  def initialize(value)
    raise ArgumentError, 'Invalid email format' if (value =~ URI::MailTo::EMAIL_REGEXP).nil?

    @value = value
  end
end
