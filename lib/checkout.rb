require_relative './confirmation_text.rb'

class Checkout

  def initialize
  end

  def check_order(order)
    order.map {|item| item.each { |k,v| puts "#{k}: #{v}"} }
    "Your total is £#{total(order)}0!"
  end

  def complete_order
    ConfirmationText.new.send
  end

  private

  def total(order)
    total = 0
    order.map { |item| item.each_value do |cost|
      total += cost
    end }
    total
  end

end
