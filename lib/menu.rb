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
    @items.keys.each_with_index do |key, index|
      value = @items[key]
      puts "#{index + 1}. #{key} (#{value})\n"
    end
  end

  def select(choice)
    @items.keys[choice - 1]
  end

end
