require 'csv'

class Menu
  def show_menu
    store_menu_data
    header
    menu_display
    footer
  end

  private
  
  def header
    puts "TAKEAWAY MENU"
    puts "=" * 39
  end

  def footer
    puts "=" * 39
  end

  def menu_display
    @menu_data.each_with_index do |(dish, price), i|
      puts "#{i + 1}. #{capitalise_item(dish).ljust(30, '.')} £#{price}"
    end
    return
  end

  def capitalise_item(dish)
    dish.split.map { |word| word.capitalize }.join(" ")
  end

  def store_menu_data
    @menu_data = load_data('../menu.csv')
  end

  def load_data(file_path)
    data = {}
    CSV.foreach(file_path) do |line|
      dish, price = line
      data[dish] = price
    end
    data
  end
end
