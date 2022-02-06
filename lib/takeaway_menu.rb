class Menu
 attr_reader :menu
  
  def initialize
    @menu = { 'Pizza' => 10, 'Fried Rice' => 8, 'Chips' => 4, 'Pepsi' => 2, 'Roti' => 2}
  end

  def display_menu
    @menu.each do |dish, price|
        puts "#{dish}, Price - £#{price}"
    end
  end
end