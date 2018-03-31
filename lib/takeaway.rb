class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99,
            "pork dumpling" => 2.99, "peking duck" => 7.99,
            "fu-king fried rice" => 5.99 }
    @basket = {}
  end

  def show_menu
    @menu
  end

  def add(item)
    @basket = { "spring roll" => 0.99 }
    # @menu.each do |k, v|
    #   if k == item
    #     @basket[k] = v
    #   end
    # end
    # puts @basket
  end

end
