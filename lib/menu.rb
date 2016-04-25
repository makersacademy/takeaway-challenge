class menu

  def initialize
    @menu = {
              :1 => { good_pizza:    8 },
              :2 => { average_pizza: 6 },
              :3 => { bad_pizza:     5 },
              :4 => { cheap_wine:    3 },
              :5 => { cheaper_wine:  1 }
            }
  end


  def list
    line_width = 30
    title = "MENU of PIZZA PIZZA"

    puts  title
    @menu.each_value do |item|
      name, price = item
      beginning = "#{name},"
      ending = "#{price}"
      puts beginning.ljust(line_width) + ending.rjust(line_width)
    end
  end

end


    #
    # puts  "ITEM               PRICE "
    # puts  "1. GOOD PIZZA            "
    # puts  "2. AVERAGE PIZZA         "
    # puts  "3. BAD PIZZA             "
    # puts  "4. CHEAP WINE            "
    # puts  "5. CHEAPER WINE          "
