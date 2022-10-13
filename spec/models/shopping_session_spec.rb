# == Schema Information
#
# Table name: shopping_sessions
#
#  id         :uuid             not null, primary key
#  glass_id   :uuid             not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ShoppingSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
