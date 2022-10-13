# == Schema Information
#
# Table name: glasses
#
#  id          :uuid             not null, primary key
#  lense_id    :uuid             not null
#  frame_id    :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quantity    :integer
#  total_price :float
#  currency_id :integer
#
FactoryBot.define do
  factory :glass do
    lense { nil }
    frame { nil }
  end
end
