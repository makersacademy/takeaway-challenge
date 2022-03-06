class Takeaway 

  def initialize
    @menu = Menu.new.menu_list
  end

  def view_menu
    @menu.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

end
