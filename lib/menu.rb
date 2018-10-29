class Menu
  attr_reader :categories
  NO_ITEM = 'No item like that'
  def initialize(categories)
    @categories = categories
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
