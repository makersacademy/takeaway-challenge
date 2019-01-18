require 'money'
I18n.enforce_available_locales = false

class BasketPrinter

  attr_reader :selection, :options

  def initialize(selection, options)
    @selection = selection
    @options = options
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
end
