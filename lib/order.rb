#!/usr/bin/env ruby

require 'money'

Money.use_i18n = false

class Order
  attr_reader :items, :currency

  def initialize(currency: 'GBP', money_class: Money)
    @items = Hash.new { |h, k| h[k] = 0 }
    @currency = currency
    @money_class = money_class
  end

  def add(item, quantity = 1)
    items[item] += quantity
  end

  def total
    items.reduce(zero) { |sum, pair| sum + subtotal(*pair) }
  end

  private

  def zero
    @money_class.new(0, currency)
  end

  def subtotal(item, count)
    item * count
  end
end
