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
class ShoppingSession < ApplicationRecord
  belongs_to :glass
  belongs_to :user
end
