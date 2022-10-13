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
FactoryBot.define do
  factory :admin_user do
    email { "MyString" }
    password_digest { "MyString" }
  end
end
