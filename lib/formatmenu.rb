class FormatMenu

  def initialize
    @header = "Mel's Meals"
    @footer = "Hope you enjoy!"
  end

  def format_menu(menu)
    puts @header
    puts "--------------------"
    menu.each do |item|
      puts "#{item[:dish].capitalize} - #{format_price(item[:price])}"
    end
    puts "--------------------"
    puts @footer
  end

  def format_price(price)
    return "£#{sprintf( '%.2f', price)}"
  end

  private :format_price

end
