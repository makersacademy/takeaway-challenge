class Takeaway

  attr_reader :order

  def initialize (menu = Menu.new)

    @menu = menu
    @order = []
  end


  def list_dishes
    
    @menu.list_items

  end

  def select(*selection, total)
    fail "Wrong total of items" if selection.count != total
    Order.new(selection, total)
    #@order << @menu.item(selection)
  end


end


