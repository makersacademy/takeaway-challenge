class Takeaway
  def initialize
    @items =[]
  end

  def displayMenu
    print Menu.displayMenu
  end

  def pickItem(item)
    if(Menu.containsItem(item))
      @items.push(item)
    else
      fail "That item is not valid"
    end
  end

  def getReciept(items)
    puts Menu.getItemAndCost(items)
    puts Menu.getCost(items).to_s
  end
end