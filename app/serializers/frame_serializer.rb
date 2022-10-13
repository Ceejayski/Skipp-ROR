# == Schema Information
#
# Table name: frames
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  status      :integer
#  stock       :integer
#  price       :float
#  currency_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FrameSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :status, :stock, :price
  attribute :currency do |object|
    Current.currency.blank? ? object.currency : Current.currency
  end
end
