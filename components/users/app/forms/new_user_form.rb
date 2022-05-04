# frozen_string_literal: true

class NewUserForm < UserForm
  validate :available_email

  attribute :email, :string

  validates :uid, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true

  def available_email
    errors.add(:email, :email_not_available) if Users::User.find_by(email: email)
  end
end
