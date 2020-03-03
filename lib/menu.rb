require_relative 'meal'

class Menu
  attr_accessor :basket, :list, :calculator

  def initialize
    @list = [
     { :name => "Beef burger", :number => 1, :price => 8 },
     { :name => "Cheese burger", :number => 2, :price => 9 },
     { :name => "Chicken burger", :number => 3, :price => 8 },
     { :name => "Veggie burger", :number => 4, :price => 6 },
     { :name => "Portobello burger", :number => 5, :price => 6 },
     { :name => "Chili burger", :number => 6, :price => 10 },
     { :name => "Full stack burger", :number => 7, :price => 10 }
     ]

    @basket = []
   end

  def print_menu
    @list.each do |item|
      puts "#{item[:number]}: #{item[:name]} ----- £#{item[:price]}"
    end
  end

  def order(num)
    raise 'Item not recognised' if num < 1 || num > 7
    @basket << @list[num - 1]
  end

  def total
    calculator = []
    @basket.each do |item|
      calculator << item[:price]
    end
    calculator.sum
    end

  def print_basket
    @basket.each do |item|
      print "#{item[:name]} ----- £#{item[:price]}\n"
    end
    print "Total: £#{total}"
  end
  end
