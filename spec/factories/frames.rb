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
FactoryBot.define do
  factory :frame do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.body }
    status { Faker::Number.within(range: 1..2) }
    stock { Faker::Number.non_zero_digit }
    price { Faker::Number.decimal(l_digits: 2) }
    currency_id { 1 }

  end
end
