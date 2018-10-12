class Menu

  def initialize
    @list = { "pizza" => 5.99, "chips" => 1.99, "burger" => 2.99, "kebab" => 3.99 }
    @menu = ""
  end

  def list_dishes
    @list.each_with_index do |(k, v), i|
      @menu << "#{i + 1}. Item: #{k}, Price £#{v}\n"
    end
    @menu
  end

# no rspec test for this yet
  def display
    print @menu
  end

  def select_dish(dish)
    order = dish
  end

end
