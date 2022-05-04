# frozen_string_literal: true

class UserRepository
  def create(user_aggregate)
    Users::User.create!(user_aggregate.to_h)
  end

  def find(uid)
    user = Users::User.find_by(uid: uid.value)

    return nil unless user

    to_aggregate(user)
  end

  def update(user_aggregate)
    user = Users::User.find_by(uid: user_aggregate.uid.value)
    user.update!(user_aggregate.to_h)
  end

  def delete(uid)
    user = Users::User.find_by(uid: uid.value)

    user.delete
  end

  def search_all
    users = Users::User.all

    users.map { |user| to_aggregate(user) }
  end

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
