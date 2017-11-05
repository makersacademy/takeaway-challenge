require 'money'

# see: https://github.com/RubyMoney/money/issues/593
Money.use_i18n = false

# MenuItem represents a single item on a menu - some sort
# of dish or drink.
class MenuItem
  attr_reader :title, :price_object

  def initialize(title, price, currency: 'GBP', money_class: Money)
    @title = title
    @price_object = money_class.new(price, currency)
  end

  def price
    price_object.format
  end

  def value
    price_object.to_f
  end
end
