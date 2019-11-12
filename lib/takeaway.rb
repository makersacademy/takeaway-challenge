class Takeaway

attr_reader :dish, :order, :list_of_dishes

  def initialize()
    @dish1 = 7
    @dish2 = 14
    @dish2 = 15
    @list_of_dishes = [{:dish1 => "£7", :dish2 => "£14", :dish3 => "£15" }]
    @dish_selection = []
    @order = [@dish_selection]
  end
  def view_menu
    puts @list_of_dishes
    end
  def select_item(dish)
    puts "what would you like to order?"
    @dish_selection[:dish1] = @dish1
    @dish_selection[:dish3] = @dish3
  end
  def view_order()
    puts "please see your order below"
    @order << @dish_selection.each
    puts @order
  end
  end
