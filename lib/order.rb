class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = Hash.new(0)
  end 

    def add_to_basket(item, number=1)
      fail 'The selected dish is not available' unless in_menu?(item)
      @dishes[item] = number
    end

    private

    def in_menu?(item)
    @menu.include?(item)
  end

end 