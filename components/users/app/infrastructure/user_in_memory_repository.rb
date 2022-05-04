# frozen_string_literal: true

class UserInMemoryRepository
  attr_accessor :records

  def initialize
    @records = []
  end

  def find(uid)
    user = @records.find { |u| u.uid == uid.value }

    return nil unless user

    to_aggregate(user)
  end

  # rubocop:disable Style/OpenStructUse
  def update(user_aggregate)
    index = @records.index { |u| u.uid == user_aggregate.uid.value }
    @records[index] = OpenStruct.new(user_aggregate.to_h)
  end

  def delete(uid)
    result = @records.filter { |u| u.uid != uid.value }
    @records = result
  end

  def create(user_aggregate)
    @records << OpenStruct.new(user_aggregate.to_h)
  end
  # rubocop:enable Style/OpenStructUse

  private

  def to_aggregate(user)
    UserAggregate.new(
      uid: UserUid.new(user.uid),
      first_name: UserFirstName.new(user.first_name),
      last_name: UserLastName.new(user.last_name),
      email: UserEmail.new(user.email),
      phone_number: UserPhoneNumber.new(user.phone_number)
    )
  end
end
