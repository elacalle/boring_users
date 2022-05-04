# frozen_string_literal: true

class UserForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :uid, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :phone_number, :string

  validates_presence_of :first_name, :last_name, :phone_number
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
  validates :phone_number, length: { is: 9 }
end
