class Takeaway
  attr_reader :menu

  def initialize 
    @menu = [
      "Beef curry: £12",
      "Fish curry: £14",
      "Lamb curry: £10",
    ]
  end

  def dishes
    menu_list = ""

    @menu.each do |item|
      menu_list = menu_list + item + " "
    end

    return menu_list.strip
  end
end
