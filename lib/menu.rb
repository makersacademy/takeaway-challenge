class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = {
      "Spag_Bol" => 6.5,
      "Pizza" => 4,
      "Chips" => 2.75
    }
  end

  def view_menu
    @menu_list.each { |k,v| puts "#{k} " + "%.2f" % v }
  end

end
