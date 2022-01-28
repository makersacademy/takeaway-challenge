require_relative "dish"

=begin

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

=end

class Takeaway

  attr_reader :dishes, :choice, :order

  def initialize
    @dishes = [curry = Dish.new("curry", 7.5), fish = Dish.new("fish", 5),
       chicken = Dish.new("chicken", 6), peas = Dish.new("peas", 35)]

    @order = []
  end 


  def list
    return @dishes.map {|i| i.info}
  end 




  def select
    continue_order = 'Y'
    while continue_order == 'Y'
      list()
      puts "Choose an item"
      choice = gets.chomp

      @dishes.each do |i|
        if i.name == choice
          @order << i

          puts "#{i.name} has been added to your order!"
        end
      end

      puts 'Would you like to order anything else? Y/N'
      continue_order = gets.chomp.upcase
    end
  end
end
 