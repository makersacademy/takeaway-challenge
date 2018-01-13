require_relative './takeaway.rb'

class Checkout

  def initialize
  end

  def check_order(order)
    order.map {|item| item.each { |k,v| puts "#{k}: #{v}"} }
    "Your total is £#{total(order)}0!"
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
