require 'money'
I18n.enforce_available_locales = false

class BasketPrinter

  attr_reader :selection, :options

  def initialize(selection, options)
    @selection = selection
    @options = options
    print_invoice
  end

  def print_invoice
    summary = "\nTotal price = #{total_price}"
    print "#{item_breakdown}#{summary}\nWould you like to proceed?"
    confirm_order
  end

  def confirm_order
    ask_user_to_confirm ? nil : print("\nYour order has not been placed")
  end

  def total_price
    price = format_invoice.map { |n| n[:total_price] }.sum
    format_price(price)
  end

  private

  def ask_user_to_confirm
    input = $stdin.gets.chomp
    print "please enter either yes or no" if input != 'Yes' && input != 'No'
    input == 'Yes'
  end

  def format_invoice
    selection.map do |key, value|
      { item: "#{key}", quantity: value, total_price: (value * options[key]) }
    end
  end

  def item_breakdown
    format_invoice.map do |choice|
      price = format_price(choice[:total_price])
      "#{choice[:item].capitalize} * #{choice[:quantity]}, price = #{price}"
    end.join("\n")
  end

  def format_price(price)
    Money.new(price * 100, "GBP").format
  end
end
