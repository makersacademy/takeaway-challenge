# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes

  def initialize
    @available_dishes = []

  end

  def load_dishes
    CSV.foreach("available_dishes.csv") do |line|
       dish, price = line
       @available_dishes << { dish: dish, price: price.to_f }
    end
  end

  def view_menu
    puts "-------Available Dishes-------"
      @available_dishes.each do |menu|
      puts "#{menu[:dish]}  Price: £ #{menu[:price]}"
    end
  end


  end



