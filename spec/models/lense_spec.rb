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
require 'rails_helper'

RSpec.describe Lense, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
