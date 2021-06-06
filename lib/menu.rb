class Menu
  
  attr_reader :takeaway_menu

  def initialize
    @takeaway_menu = { "Spring roll" => 0.99, "Char sui bun" => 3.99, 
    "Pork dumpling" => 2.99, "Peking duck" => 7.99, 
    "Fu-king fried rice" => 5.99 }
  end

  def display_menu
    takeaway_menu.each do |food, price|
      puts "#{food}. Price = £#{price}"
    end
  end

  def selection(choice)
    takeaway_menu.has_key?(choice) ? choice : selection(STDIN.gets.chomp.to_s)
  end

  def price(choice)
    takeaway_menu[choice]
  end
end
