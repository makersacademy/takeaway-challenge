class Menu

  def view
    menu_list
    puts "\n\n\n\n"
    title = "Bobs Cafe\n\n"
    puts title.center(45)
    @menu_hash.each {|item,cost| puts "#{item.ljust(40)}£#{cost}\n"}
    waiter = "Tip your waiters"
    puts "\n\n\n" + waiter.center(45) + "\n\n\n"

  end

  def send_menu
    menu_list
    @menu_hash.dup
  end

  private

  attr_reader :menu_hash

  def menu_list

    @menu_hash = {

      "Burger" => 5, "Fries" => 2, "Pizza" => 8, "Drink" => 1,
    }

  end

end
