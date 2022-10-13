# == Schema Information
#
# Table name: admin_users
#
#  id              :uuid             not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class AdminUser < ApplicationRecord
  # Association
  has_secure_password

  # Validation
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
end
