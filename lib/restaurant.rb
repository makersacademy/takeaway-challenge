class Restaurant
  attr_reader :menu

  def initialize
    @menu = {
      'bibimbap'=>10.50,
      'bulgogi'=>10.00,
      'naengmyeon'=>8.00
    }
  end

  def see_menu
    @menu.each { |k, v| @menu[k] = "£%.2f" % v.to_s } 
  end
end