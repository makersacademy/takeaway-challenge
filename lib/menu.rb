class Menu

attr_reader :selected_items

  def initialize
    @options = { "Burger" => 5.00, "Chips" => 2.00,
      "Noodles" => 4.50, "Pizza" => 7.00, "Kielbasa" => 3.00,
      "Egg" => 1.00, "Platter" => 20.00, "Water" => 99.99 }
    @selected_items = []
  end

  def list 
    puts "Menu"
    @options.each { |key, val| puts "#{key}: £#{sprintf "%.2f", val}" }
  end

  def select(item)
      @selected_items << { item => @options[item] }
  end 
end