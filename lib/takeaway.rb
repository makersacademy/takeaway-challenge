class Takeaway

  MENU = [["Pizza", 4], ["Burger and chips", 5], ["Lobster and chips", 12]]

  def initialize(menu = MENU)
    @menu = menu
  end

  def show_menu
    @menu.each { |item| puts "#{item[0]} - £#{item[1]}" }
  end

  

end
