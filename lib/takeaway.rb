class Takeaway
  def initialize(menu)
    @menu = menu
    @menu_array = @menu.menu
  end

  def list_food
    puts "*** Takeaway Menu! (ﾉ◕ヮ◕)ﾉ ***"
    @menu_array.each do |item|
      puts "#{1 + @menu_array.index(item)}. #{item[:name]}. (£#{item[:price]}0)"
    end
    puts "*** *** *** *** *** ***"
  end

  def order(selection)
    raise "ERROR: It looks like something went wrong with your order request." unless is_nil_selection(selection)
  end

  def check_total(selection)
    raise "ERROR: It looks like something went wrong with your selection." unless is_nil_selection(selection)
    subtotal = 0
    selection[:dishes].each do |order_item|
      @menu_array.each do |menu_item|
        if order_item[:nickname] == menu_item[:nickname]
          subtotal += (menu_item[:price] * order_item[:quantity])
        end
      end
    end
    return subtotal == selection[:total] ? true : false
  end

  private
  def is_nil_selection(selection)
    selection[:dishes] != nil && selection[:total] != nil
  end
end
