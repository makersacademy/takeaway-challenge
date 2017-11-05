require 'money'
require './lib/formats/itemisedformat'

# see: https://github.com/RubyMoney/money/issues/593
Money.use_i18n = false

# The Order class represents a single order. It stores a number
# of dishes against their quantities.
class Order
  attr_reader :items, :currency, :time

  class << self
    def from_selection(menu, hash, **kwargs)
      items = Hash[hash.map { |index, count| [menu.get(index), count] }]
      validate_order(new(existing: items, **kwargs))
    end

    private

    def validate_order(order)
      raise RangeError unless order.items.keys.all?
      order
    end
  end

  def initialize(existing: {}, currency: 'GBP', 
                 money_class: Money, time_class: Time
                )
    @items = Hash.new { |hash, key| hash[key] = 0 }.update(existing)
    @currency = currency
    @money_class = money_class
  end

  def add(item, quantity = 1)
    items[item] += quantity
  end

  def total
    items.reduce(zero) { |sum, pair| sum + subtotal(*pair) }
  end

  def format(formatter = ItemisedFormat.new, *args)
    items.map { |pair| formatter.format(*pair, *args) }.join("\n")
  end

  private

  def subtotal(item, count)
    item.price_object * count
  end

  def zero
    @money_class.new(0, currency)
  end
end
