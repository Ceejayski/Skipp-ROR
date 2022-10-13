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
class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :currency
  attribute :shopping_basket do |object|
    GlassSerializer.new(object.glasses)
  end
end
