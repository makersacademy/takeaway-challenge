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

  #def new_item

  def show_items
    puts ""
    @item_list.each do |item|
      puts "\t#{item.name}....£#{item.price}"
    end
    puts ""
  end

end
