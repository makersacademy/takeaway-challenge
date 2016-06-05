class Menu

attr_reader :items

  def initialize(items)
    @items = items
  end

  def show
    items.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

  def has_item?(item)
    !items[item].nil?
  end
end
