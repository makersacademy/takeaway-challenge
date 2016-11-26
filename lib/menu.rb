class Menu

  attr_accessor :menu_list

  def initialize(dishes)
    @menu_list = dishes
  end

  def view_menu
    @menu_list.each { |k,v| puts "#{k} " + "%.2f" % v }
  end

end
