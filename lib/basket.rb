require_relative 'order'
require_relative 'take_away_ui'

class Basket

attr_reader :selection, :menu_choice, :itemised_bill

  def initialize(selection=[], menu_choice= ItalianMenu.new(:dinner, :all).dishes)
    @selection = selection
    @menu_choice = menu_choice
  end

  def itemised_bill
    # p "Unexpected Item In Bagging Area, removing item" if unexpected_item_in_bagging_area?
    @selection.each_with_index {|meal, index| meal << meal[1..2].inject(:*)}
    
  end

  # def remove_unexpected_items
  #   @selection = selection.transpose[0].delete_if{|dish| @menu_choice.include?(dish)}
  # end

# private

  def look_up_prices
    # @selection = removed_unexpected_items if unexpected_item_in_bagging_area?
    @selection.each{|full_order| full_order << menu_choice[full_order[0]]}
  end

  def total_bill
    itemised_bill.transpose.last.inject(:+)
  end

#   def removed_unexpected_items
#     @selection.each.keep_if{|full_order| @menu_choice.include?(full_order[0])}
#   end
#
# # [[][][]]
#   def unexpected_item_in_bagging_area?
#     check = @selection.transpose[0].delete_if{|dish| @menu_choice.include?(dish)}
#     check.size == selection.size
#   end




end
