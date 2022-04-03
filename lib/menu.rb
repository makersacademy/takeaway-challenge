class Menu
  
  MENU_HASH = { 
    "Fried Rice" => 6.0,
    "Chow Mein" => 6.1,
    "Chop Suey" => 6.2,
    "Satay" => 6.3,
    "Salt & Pepper" => 6.4,
    "Sweet & Sour" => 6.5,
    "Chips" => 1.5,
    "Large Chips" => 2.0,
    "Fish" => 3.0,
    "Sausage" => 1.2,
    "Pie" => 1.3,
    "Gravy" => 1.0,
    "Peas" => 0.8,
    "Spring Rolls" => 2.8
  }.freeze

  def initialize
    @list = MENU_HASH
  end

  def show_menu
    @list.each_with_index do |(item, price), index|
      puts "#{index + 1}. #{item} £#{'%.2f' % price}"
    end
  end
end
