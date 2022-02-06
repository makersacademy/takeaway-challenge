class Menu
  MENU = { 'Pizza' => 10, 'Fried Rice' => 8, 'Chips' => 4, 'Pepsi' => 2, 'Roti' => 2}
  
  def display_menu
    MENU.each do |dish, price|
        puts "#{dish}, Price - £#{price}"
    end
  end
end