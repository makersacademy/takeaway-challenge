class Menu

  def initialize
    @list = { "pizza" => 5.99, "chips" => 1.99, "burger" => 2.99, "kebab" => 3.99 }
#    @list = { "pizza" => 5.99 }
    @menu = ""
  end

  def list_dishes
    @list.each do |k, v|
      @menu << "Item: #{k}, Price £#{v}\n"
    end
    @menu
  end

  def display
    print @menu
  end

end

menu = Menu.new
menu.display
