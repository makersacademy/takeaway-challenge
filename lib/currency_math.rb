# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'

module CurrencyMath
  def multiply(to_decimal, multiplier)
    (to_decimal.to_d * multiplier.to_d).currency_string
  end

  def add(to_decimal, addend)
    (to_decimal.to_d + addend.to_d).currency_string
  end

  def subtract(to_decimal, subtrahend)
    (to_decimal.to_d - subtrahend.to_d).currency_string
  end
end

class BigDecimal
  def currency_string
    truncate(2).to_s('F').with_trailing_zeros
  end
end

class String
  def with_trailing_zeros
    s = split('.')
    s.last << '0' while s.last.size < 2 && s.size > 1
    s.join('.')
  end
end

