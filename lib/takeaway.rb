class Takeaway

  def initialize
    @menu = { :Chips => 2.50, :Burger => 5, :Coke => 1.50, :Chilli => 3 }
    @basket = {}
  end

  def menu
    @menu.each { |item, price| puts "#{item} - £#{price}" }
  end

  def selection
    puts "What would you like from the menu?"
    input = gets.chomp.capitalize.to_sym
    p input
    @menu.map { |item, price| if input == item
    @basket.store(item, price) end }
  end

  def basket
    @basket.map { |item, price| return "#{item} - £#{price}" }
  end

end
