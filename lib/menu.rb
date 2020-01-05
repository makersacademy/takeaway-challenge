require_relative 'takeaway'

class Menu
  attr_reader :items

  def initialize
    items
  end 
  
  def items
    @items = { "Spring Roll" => 4.99, "Pork Dumpling" => 6.99 }
  end

  def list
    @items.keys.each_with_index do |item, index|
      price = @items[item]
      puts "#{index + 1}. #{item} (#{price})\n"
    end
  end

end
