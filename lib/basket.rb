require_relative 'global_constants'

class Basket

  def initialize
    @items = []
  end

  def add(item, qty = 1)
    if item_in_basket?(item)
      @items[item_position(item)]["qty"] += qty
    else
      @items << { "item" => item, "qty" => qty }
    end
  end

  def delete(item, qty = 1)
    raise "item not in basket" unless item_in_basket?(item)
    pos = item_position(item)
    if @items[pos]["qty"] < qty
      raise "invalid quantity"
    elsif @items[pos]["qty"] == qty
      @items.delete_at(pos)
    else
      @items[pos]["qty"] -= qty
    end
  end

  def items
    @items.dup
  end

  def view
    divider_len = GlobalConstants::DIVIDER_LEN
    border_div = GlobalConstants::BORDER_DIV
    section_div = GlobalConstants::SECTION_DIV
    display_menu = border_div * divider_len
    display_menu += "\n" + section_div * divider_len + "\n" + "Basket" + "\n" + section_div * divider_len
    @items.each { |dish| display_menu += "\n" + "#{dish["item"]["id"]}. #{dish["item"]["dish"]} £#{dish["item"]["price"]} x #{dish["qty"]}" }
    display_menu += "\n" + section_div * divider_len + "\n" + "total £" + total_price.round(2).to_s + "\n" + border_div * divider_len
  end

  def clear
    @items = []
  end

  def empty?
    @items.empty?
  end

  def item_qty(item)
    item_in_basket?(item) ? @items[item_position(item)]["qty"] : 0
  end

  def total_price
    price = 0.0
    @items.each { |dish| price += dish["item"]["price"].to_f * dish["qty"] }
    price
  end

  private

  def item_in_basket?(item)
    item_position(item) >= 0
  end

  def item_position(item)
    pos = -1
    @items.each_with_index { |dish, i| pos = i if dish["item"] == item }
    pos
  end
end