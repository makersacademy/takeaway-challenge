
class Menu
  attr_accessor :items

  def initialize
      @items = {
        "1. meatballs" => 5,
        "2. carrots" => 2,
        "3. bread" => 1,
        "4. juice" => 3,
        "5. milk" => 1 }
  end

  def display
    @items.each { |k, v| puts "#{k} £#{v}" }
  end

end
