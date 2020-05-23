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
    items.each_with_index do |(item, price), i|
      capitalised_item = item.split.map { |word| word.capitalize }.join(" ")
      puts "#{i + 1}. #{capitalised_item.ljust(30, '.')} £#{price}"
    end
    return
  end

  def items
    {
      "spring roll"        => 0.99, 
      "char sui bun"       => 3.99, 
      "pork dumpling"      => 2.99, 
      "peking duck"        => 7.99, 
      "fu-king fried rice" => 5.99
    }
  end
end
