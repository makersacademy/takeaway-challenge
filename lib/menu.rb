class Menu

  MENU = { ribs_in_bbq_sauce: 2.50,
           prawn_toast: 2.50,
           spring_rolls: 2.00,
           quarter_peking_duck: 5.00,
           half_peking_duck: 7.50,
           duck_in_plum_sauce: 5.50,
           sweet_and_sour_pork: 5.00,
           chow_mein: 3.00,
           singapore_noodles: 3.50,
           egg_fried_rice: 2.00,
           prawn_crackers: 1.00 }

  attr_reader :menu
  attr_reader :total_cost
  attr_reader :order_summary

  def initialize
    @menu = MENU
    @order_summary = {}
    @total_cost = 0
  end

  def check_menu
    page_width = 50
    puts 'MENU'.center(page_width)
    formatting menu
  end

  def add_to_order quantity, dish
    fail "Sorry! That's not on the menu!" unless @menu.include? dish
    @order_summary[dish]= (menu[dish] * quantity)
    add_to_total_cost quantity, dish
  end

  def check_order_summary
    page_width = 50
    puts 'ORDER SUMMARY'.center(page_width)
    formatting order_summary
    puts 'Total:'.ljust(page_width/2) + ('£' + total_cost.to_s + '0').rjust(page_width/2)
  end

  private

    def add_to_total_cost quantity, dish
      item_cost = menu[dish] * quantity
      @total_cost += item_cost
    end

    def formatting hash
      hash.each do |k, v|
        page_width = 50
        puts (k.to_s.ljust(page_width/2) + ('£' + v.to_s + '0').rjust(page_width/2))
      end
    end


end