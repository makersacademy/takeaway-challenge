class Order

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def add_to_order(choice)
     raise "Invalid Choice: Please pick a food on the menu" if @menu.available_dishes(choice) == false

     #@menu.select
  end
end
