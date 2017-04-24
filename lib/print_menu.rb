#Outputs the menu options to the user
class Print_menu

  def print(menu)
    print_header
    print_menu_content(menu)
    print_footer(menu)
  end

  def print_header
    puts "The takeaway menu".center(100)
    puts "-------------\n".center(100)
  end

  def print_menu_content(menu_items)
    items_group = menu_items.group_by { |x| x[:type] }
    items_group.each do |type, menu_items|
      puts "#{type.capitalize}s:".center(10)
      menu_items.each_with_index{ |x| puts "#{x[:item]}: #{x[:name].capitalize}   £#{x[:price]}".center(100) }
    end
  end


  def print_footer(menu_items)
    puts ""
    if menu_items.count > 0; puts "Overall, we have #{menu_items.count} delicious options on the menu".center(100)
    else names.count == 0; puts "We have no Students!".center(100)
    end
    puts ""
  end
end
