class Menu
  attr_reader :menu, :show_menu
  CURRENCY = "£"

  def initialize
    @menu = {}
    @menu[:pizza] = 7.00
    @menu[:kebab] = 8.00
    @menu[:burger] = 5.00
    @menu[:chips] = 3.00
  end

  def show_menu
    @menu.each do |key, value|
      puts "#{key}: #{CURRENCY}#{value}"
    end
  end

end
