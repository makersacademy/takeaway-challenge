class Menu
  attr_reader :categories
  NO_ITEM = 'No item like that'
  def initialize(categories)
    @categories = categories
  end

  def find_item_by_name(item_name)
    res = nil
    @categories.each do |category|
      category.items.each do |item|
        res = item if item.name == item_name
      end
    end
    raise NO_ITEM if res.nil?
    res
  end
end
