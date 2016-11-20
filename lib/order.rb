class Order
attr_accessor :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def select_dish(amount, choice)
    while amount != 0
      @list_of_dishes << "#{choice}: #{menu[choice.to_sym]}"
      amount -= 1
    end
    @list_of_dishes
  end

  def menu
    @menu = {
      cheeseburger: "£8.50",
      fries: "£3.75"
    }
  end

  def print_menu
    menu.each {|key, value| puts "#{key}: #{value}" }
  end

end
