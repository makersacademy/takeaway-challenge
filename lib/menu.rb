class Menu
  attr_reader :categories
  NO_ITEM = 'No item like that'
  def initialize(categories)
    @categories = categories
  end
  
  class Category 
    attr_reader :name, :items
    def initialize(name)
      @name = name
      @items = []
    end
    
    def add_dish(dish)
      @items << dish
    end
  end

  class Dish
    attr_reader :name, :price
    def initialize(name, price)
      @name = name
      @price = price
    end
  end
  
  def find_item_by_name(item_name)
    res = nil
    @categories.each do |category|
      res ||= find_item_in_category(category, item_name)
    end
    raise "#{NO_ITEM}: #{item_name}" if res.nil?
    res
  end

  private

  def find_item_in_category(category, name)
    category.items.find do |item| 
      item.name == name
    end
  end
end
