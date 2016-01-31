require "./lib/item.rb"

class Menu

  def initialize
    @item_list = []
  end

  def item_list
    @item_list.clone.freeze
  end

  def add_item(item)
    @item_list.push item
  end

  def show_items
    @item_list.each do |item|
      return "#{item.reference}....#{item.name}....£#{item.price}"
    end
  end

end
