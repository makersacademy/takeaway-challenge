require_relative 'takeaway'
require_relative 'orders'

module Menu

  MENU = {"Chicken" => 5.00, "Madras" => 6.00, "Nan Bread" => 2.50, "Cobra" => 4.00}

  def show_menu
    MENU.each { |item, price| "#{item}, #{price}"}
  end

  def hash_menu
    MENU
  end

end
