class Menu

  attr_reader :menu

  CURRENCY = "£"

  def initialize
    @menu = {}
    @menu[:pizza] = 8.00
    @menu[:burger] = 5.00
    @menu[:chips] = 2.00
    @menu[:fish] = 6.00
    @menu[:falafel_wrap] = 4.50
  end

  def show_menu
    @menu.each do |item, price|
      puts "#{item}: #{CURRENCY}#{price}"
    end
  end
end
