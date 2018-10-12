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
    raise "ERROR: It looks like something went wrong with your order request." unless selection[:dishes] != nil && selection[:quantities] != nil && selection[:total] != nil
  end

  def check_total(selection)
    true
  end
end
