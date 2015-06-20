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

  def initialize
    @menu = MENU
  end

  def check
    page_width = 40
    puts 'MENU'.center(page_width)
    @menu.each do |k, v|
      puts (k.to_s.ljust(page_width/2) + ('£' + v.to_s + '0').rjust(page_width/2))
    end
  end

  def add_to_order quantity, dish
   fail "Sorry! That's not on the menu!" unless @menu.include? dish
  end

end