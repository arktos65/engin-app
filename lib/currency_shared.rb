module CurrencyShared
  # Returns the currency symbol for the specified currency id from
  # the Currencies table.
  def get_symbol(key)
    currency = Currency.find_by(id: key)
    return currency.symbol
  end

  # Returns the exchange rate for the specified currency id from
  # the Currencies table.
  def get_exchange(key)
    currency = Currency.find_by(id: key)
    return currency.USDExchange
  end
end
