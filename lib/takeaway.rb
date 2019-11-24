class Takeaway

  attr_reader :menu

  def initialize
    @menu = { "Chicken Chow Mein" => 6.50, "Egg Fried Rice" => 4.80 }
  end

  def show_menu
    @menu.each_with_index {|(k,v), index|
      p "#{index + 1}. #{k} = £#{v}\n" 
    }
  end


end
