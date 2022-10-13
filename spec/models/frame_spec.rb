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
require 'rails_helper'

RSpec.describe Frame, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
