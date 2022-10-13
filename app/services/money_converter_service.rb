class MoneyConverterService
  def initialize(amount, currency)
    @amount = amount
    @currency = currency

  end

  def convert(user_currency)

    Money.from_amount(@amount, @currency).exchange_to(user_currency).to_f
  end
end
