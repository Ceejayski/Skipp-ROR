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
class Frame < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Scopes
  scope :active, -> { where(status: :active) }
  enum status: [:active, :inactive]

  # Associations
  belongs_to :currency
  has_many :glasses, dependent: :destroy
  has_many :lenses, through: :glasses

  # Validations
  validates_presence_of :name, :description, :status, :stock, :price, :currency_id
  validates :price, uniqueness: { scope: :currency_id, message: 'already exists' }
  validates_inclusion_of :status, in: statuses.keys, message: 'is not a valid status'
  validates :price, numericality: { only_float: true }
  validates_numericality_of :stock, :currency_id, only_integer: true
  validates_numericality_of :stock,  greater_than_or_equal_to: 0, message: 'ran out of stock', if: -> { !new_record? }
  validates :currency, inclusion: { in: Currency.all }


  # Methods

  def price
    Current.currency.blank? ? super : MoneyConverterService.new(super, self.currency.name).convert(Current.currency.name)
  end

  # def currency_id
  #   Current.currency.blank? ? super : Current.currency.id
  # end
end
