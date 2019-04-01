class Menu
  attr_reader :food
  def initialize
    @food = {
      "korma" => 7, "tikka" => 8, "jalfrezi" => 9, "rice" => 3, "naan" => 3
    }
  end

  def show_menu
    @food.each { |item, price| puts "Item: #{item} - Price: £#{price}" }
  end
end
