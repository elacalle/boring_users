# frozen_string_literal: true

class UserAggregate
  attr_accessor :uid, :first_name, :last_name, :email, :phone_number

  def initialize(parameters)
    assign(parameters)
  end

  def assign(parameters)
    @uid = parameters[:uid]
    @first_name = parameters[:first_name]
    @last_name = parameters[:last_name]
    @email = parameters[:email]
    @phone_number = parameters[:phone_number]
  end

  def to_h
    {
      uid: uid.value,
      first_name: first_name.value,
      last_name: last_name.value,
      email: email.value,
      phone_number: phone_number.value
    }
  end
end
