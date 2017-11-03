#!/usr/bin/env ruby

require 'money'

# configures Money object to avoid known bug
# see: https://github.com/RubyMoney/money/issues/593

Money.use_i18n = false

# The MenuItem class represents a single item on a menu - some sort
# of dish or drink.

class MenuItem
  attr_reader :title, :price_object

  def initialize(title, price, money_class: Money)
    @title = title
    @price_object = money_class.new(price)
  end

  def price
    price_object.format
  end

  def value
    price_object.to_f
  end
end
