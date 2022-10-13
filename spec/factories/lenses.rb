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
FactoryBot.define do
  factory :lense do
    color { Faker::Color.color_name }
    description { Faker::Lorem.body }
    prescription_type { Faker::Number.within(range: 1..3) }
    lens_type { Faker::Number.within(range: 1..23) }
    stock { Faker::Number.non_zero_digit }
    price { Faker::Number.decimal(l_digits: 2) }
    currency_id { 1 }
  end
end
