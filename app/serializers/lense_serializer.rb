# == Schema Information
#
# Table name: lenses
#
#  id                :uuid             not null, primary key
#  color             :string
#  description       :text
#  prescription_type :integer
#  lens_type         :integer
#  stock             :integer
#  price             :float
#  currency_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class LenseSerializer
  include JSONAPI::Serializer
  attributes :color, :description, :prescription_type, :lens_type, :stock, :price
  attribute :currency do |object|
    Current.currency.blank? ? object.currency : Current.currency
  end
end
