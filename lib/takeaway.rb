require 'byebug'

MENU = {
  "Samosas" => 5.20,
  "Chilli Chicken" => 7.50,
  "Pau Bhaji" => 5.90,
  "Chicken Ruby"  => 12.9, 
  "Mattar Paneer" => 11.9, 
  "Chole" => 9.50,
  "Black Daal" => 7.50
}

class Takeaway

  attr_accessor :menu_items, :args

  def view_menu
    MENU
  end

  def order(*args)
    "Your ordered items are #{@args}" 
  end

  def receipt
    MENU.select{|key, value| p value }
  end
end