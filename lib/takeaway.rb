class Takeaway
  def initialize(menu, client)
    @menu = menu
    @client = client
    @menu_array = @menu.menu
    @current_selection = nil
  end

  attr_reader :current_selection

  def list_food
    puts "*** #{@menu.name} Menu! #{@menu.logo} ***"
    @menu_array.each do |item|
      puts "#{1 + @menu_array.index(item)}. #{item[:name]}. (£#{'%.2f' % item[:price]})"
    end
    puts "*** *** *** *** *** ***"
  end

  def order(selection)
    raise "ERROR: It looks like something went wrong with your order request." unless nil_selection?(selection)

    raise "ERROR: It looks like something went wrong with your selection." unless check_total(selection)

    confirm_order(selection)
  end

  def check_total(selection)
    raise "ERROR: It looks like something went wrong with your selection." unless nil_selection?(selection)
    subtotal = 0
    selection[:dishes].each do |order_item|
      @menu_array.each do |menu_item|
        if order_item[:nickname] == menu_item[:nickname]
          subtotal += (menu_item[:price] * order_item[:quantity])
        end
      end
    end
    return subtotal == selection[:total]
  end

  def confirm_order(selection)
    @current_selection = selection
  end

  private
  def nil_selection?(selection)
    selection[:dishes] != nil && selection[:total] != nil
  end
end
