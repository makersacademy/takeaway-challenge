require_relative 'order'
require_relative 'take_away_ui'

class Basket

attr_reader :selection, :menu_choice

  def initialize(selection=[], menu_choice= ItalianMenu.new(:dinner, :all).dishes)
    @selection = selection
    @menu_choice = menu_choice
  end

  def itemised_bill
    "Unexpected Item In Bagging Area, removing item" if unexpected_item_in_bagging_area?
    remove_unexpected_items
    look_up_prices.map! {|meal| meal << (meal[1].to_i * meal[2].to_i)}
  end

  def total_bill
    itemised_bill.transpose.last.inject(:+)
  end


private

  def look_up_prices
    @selection.each{|full_order| full_order << menu_choice[full_order[0]]}
  end

  def remove_unexpected_items
    unexpected_items = (selection.transpose[0] - menu_choice.keys)
    reselection = selection.delete_if {|item| item[0] == unexpected_items[0]}
    @selection = reselection
  end

  def unexpected_item_in_bagging_area?
    unexpected_items = menu_choice.keys & selection.transpose[0]
    unexpected_items.size >= 1
  end

end
