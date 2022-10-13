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
class Lense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Scopes
  enum prescription_type: %i[fashion single_vision varifocals]
  enum lens_type: %i[classic blue_light transition]
  # Associations
  belongs_to :currency
  has_many :glasses, dependent: :destroy
  has_many :frames, through: :glasses

  # Validations
  validates_presence_of :color, :description, :prescription_type, :lens_type, :stock, :price, :currency_id
  validates :price, uniqueness: { scope: :currency_id, message: 'already exists' }
  validates_inclusion_of :prescription_type, in: prescription_types.keys, message: 'is not a valid prescription type'
  validates_inclusion_of :lens_type, in: lens_types.keys, message: 'is not a valid lens type'
  validates :price, numericality: { only_float: true }
  validates_numericality_of :stock, :currency_id, only_integer: true, message: 'can only be whole number.'
  validates :currency, inclusion: { in: Currency.all }


    def price
      Current.currency.blank? ? super : MoneyConverterService.new(super, self.currency.name).convert(Current.currency.name)
    end

end
