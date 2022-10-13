# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  password_digest :string
#  currency_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Associations
  has_many :shopping_sessions, dependent: :delete_all
  has_many :glasses, through: :shopping_sessions
  belongs_to :currency
  has_secure_password

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :currency, inclusion: { in: Currency.all }, presence: true

end
