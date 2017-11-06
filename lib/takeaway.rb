# Order class for takeaway challenge
require 'menu'
require 'restaurant'

class TakeAway
  attr_reader :sum_total, :quantity, :chosen_meal, :basket_summary

  def initialize
    @basket_summary = []
    @single_order = {}
    @sum_total = 0
  end

  def menu_options
    { 'Miso Soup' => 1.50, 'Saitan' => 2.50, 'Tofu Steak' => 3.00 }
  end

  def list_of_dishes
    n = 0
    menu_options.each do |meal, value|
      puts "#{n += 1}. #{meal} > #{value}"
    end
  end

  def order(chosen_meal, quantity = 1)
    @single_order = { quantity: quantity, chosen_meal: chosen_meal }
    @basket_summary << @single_order
    p print_message
    @single_order = {}
  end

  def sum_total
    @sum_total += menu_options[:chosen_meal] * @single_order[:quantity]
  end

  def print_message
    "x #{@single_order[:quantity]} #{@single_order[:chosen_meal]} added to your basket."
  end

  def print_basket_summary
    @basket_summary.map do |item|
      number = item[:quantity]
      food = item[:chosen_meal]
       "#{number} of #{food},"
    end
  end

end
