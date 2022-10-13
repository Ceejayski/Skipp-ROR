class Current < ActiveSupport::CurrentAttributes
  attribute :currency

  def self.currency
    super
  end
end
