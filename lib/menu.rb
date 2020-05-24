require 'csv'

class Menu
  def show_menu
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
    menu_data.each_with_index do |(item, price), i|
      capitalised_item = item.split.map { |word| word.capitalize }.join(" ")
      puts "#{i + 1}. #{capitalised_item.ljust(30, '.')} £#{price}"
    end
    return
  end

  def menu_data
    load_data('../menu.csv')
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
