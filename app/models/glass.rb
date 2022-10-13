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
class Glass < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :lense
  belongs_to :frame
  has_one :shopping_session
  has_one :user, through: :shopping_session
  belongs_to :currency

  # Validations
  validates_presence_of :quantity
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 1

end
