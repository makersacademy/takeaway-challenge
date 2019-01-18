require 'money'
I18n.enforce_available_locales = false

class Basket

  attr_reader :selection, :options

  def initialize(selection, options)
    @selection = selection
    @options = options
  end

  def validate_selection
    is_hash?(selection)
    has_quantity?(selection)
    items_availabe?(selection)
  end

  def print_invoice
    print "#{create_invoice_array}\nTotal price = #{total_price}"
  end

  def total_price
    price = format_invoice.map {|n| n[:total_price]}.sum
    format_price(price)
  end

private
  def format_invoice
    selection.map do |key, value|
      {item: "#{key}", quantity: value, total_price: (value * options[key])}
    end
  end

  def create_invoice_array
    format_invoice.map do |choice|
      "#{choice[:item].capitalize} * #{choice[:quantity]}, price = #{format_price(choice[:total_price])}"
    end.join("\n")
  end

  def format_price(price)
    Money.new(price * 100, "GBP").format
  end


  def is_hash?(selection)
    fail "selection must be hash" if !selection.is_a?(Hash)
  end

  def has_quantity?(selection)
    selection.each_pair do |key, value|
      fail "each item must have quantity" if !value.is_a?(Integer)
    end
  end

  def items_availabe?(selection)
    selection.each_pair do |key, value|
      fail "not all items available" if !options.include?(key)
    end
  end
end
