#!/usr/bin/env ruby

require 'money'
require './lib/formats/itemisedformat'

# configures Money object to avoid known bug
# see: https://github.com/RubyMoney/money/issues/593

Money.use_i18n = false

# The Order class represents a single order. It stores a number
# of dishes against their quantities.

class Order
  attr_reader :items, :currency

  def initialize(currency: 'GBP', money_class: Money)
    @items = Hash.new { |hash, key| hash[key] = 0 }
    @currency = currency
    @money_class = money_class
  end

  def add(item, quantity = 1)
    items[item] += quantity
  end

  def total
    items.reduce(zero) { |sum, pair| sum + pair.reduce(1, :*) }
  end

  def format(formatter = ItemisedFormat.new, *args)
    items.map { |pair| formatter.format(*pair, *args) }.join("\n")
  end
    
  private

  def zero
    @money_class.new(0, currency)
  end
end
