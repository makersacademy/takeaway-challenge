class Menu

attr_reader :menu_arr

  def initialize
    @menu_arr = [["Calamari Fritti",3.99],
    ["Pollo Salad",4.99],
    ["Penne Pomodoro",6.99],
    ["Vegetable Lasagne",6.99],
    ['Diavola Pizza 10"',10.55],
    ['Capricciosa Pizza 13"',11.55],
    ['Quattro Formaggi Pizza 15"',13.15],
    ['Tiramisu',3.55],
    ['Affogato',3.55]
  ]
  end

  def show_menu
      @menu_arr.each_with_index { |(menu_item, price), index|
        p "#{index+1}. #{menu_item} ---- £#{price}" }
    end

end
