class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def show_menu
    @menu.items.each_pair do |item_number, item|
      puts "#{item_number}. #{item[:name]}: £#{item[:price]}\n"
    end
    
    puts
  end
end
