require_relative "dish"

class Takeaway

  attr_reader :dishes, :choice, :order

  # for rspec
  attr_reader :continue_order

  def initialize
    @dishes = [yaki = Dish.new("Chicken Chow Origin Mein", 7),soup = Dish.new("Bool of soup", 7),
       rice = Dish.new("RSPECial Fried Rice", 5),
       eggs = Dish.new("DEViled Eggs", 6), drink = Dish.new("Rubycon", 2)]

    @order = []
  end 

  def list
    return @dishes.map { |i| i.info }
  end 

  def select
    @continue_order = 'Y'
    while @continue_order == 'Y'
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
      @continue_order = gets.chomp.upcase
    end
  end

  def total
    total = 0
    

    @order.each do |i|
      total += i.price
    end

    time = Time.new
    return "Thanks for using just.each!
    
You ordered #{@order.map { |i| i.name + " £" + i.price.to_s }}

Your total is £#{total}. Your order will be delivered by #{time.hour + 1}:#{time.min}"

  end

  def read_text_order(text)
    @dishes.each do |i|
      if text.downcase.include?(i.name.downcase)
        @order << i
      end
    end

    return total()
  end
end