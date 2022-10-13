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
require 'rails_helper'

RSpec.describe Glass, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
