# frozen_string_literal: true

class UserResponseMapper
  def call(user_aggregate)
    {
      uid: user_aggregate.uid.value,
      first_name: user_aggregate.first_name.value,
      last_name: user_aggregate.last_name.value,
      email: user_aggregate.email.value,
      phone_number: user_aggregate.phone_number.value
    }
  end
end
