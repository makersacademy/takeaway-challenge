class Menu

  attr_reader :full_menu

  def initialize
    @full_menu = { 'Battered cod' => 3.99, 'Pukka pie' => 1.49, 'Breaded plaice' => 4.99, 'Small chips' => 1.99, 'Large chips' => 2.99 }
  end

  def view_menu
    @full_menu
  end
end
