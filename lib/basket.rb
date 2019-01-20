require 'money'
I18n.enforce_available_locales = false

class Basket

  attr_reader :selection, :options

  def initialize(selection, options)
    @selection = selection
    @options = options
  end

  def print_invoice(message_sender = MessageSender)
    print formatted_invoice
    confirm_order(message_sender)
  end

  def confirm_order(message_sender)
    ask_user_to_confirm ? message_sender.new : print("\nYour order has not been placed")
  end

  private

  def summary
    total_price = selection.map { |choice| find_price(choice[:name]) * choice[:quantity] }.sum
    "\nTotal price = #{format_price(total_price)}"
  end

  def find_price(name)
    options.select { |item| item[:name] == name }[0][:price]
  end

  def formatted_invoice
    "#{breakdown}#{summary}"
  end

  def ask_user_to_confirm
    print "\nWould you like to proceed?"
    input = $stdin.gets.chomp
    print "please enter either yes or no" if input != 'Yes' && input != 'No'
    input == 'Yes'
  end

  def breakdown
    selection.map do |choice|
      name, quantity = choice[:name], choice[:quantity]
      price = (quantity * find_price(name))
      "#{name} * #{quantity}, price = #{format_price(price)}"
    end.join("\n")
  end

  def format_price(price)
    Money.new(price * 100, "GBP").format
  end
end
