class Takeaway
  attr_reader :menu, :my_order

  def initialize 
    @menu = [
      "Beef curry: £12",
      "Fish curry: £14",
      "Lamb curry: £10",
    ]
    @my_order = []
  end

  def dishes
    
    menu_list = ""
    @menu.each do |item|
      menu_list = menu_list + item + " "
    end
    # .strip is used to remove last trailing white space on printed string
    return menu_list.strip
  end

  def add_to_order(item)
    if @menu.include?(item)
      @my_order << item
    end
    return my_order
  end
end
