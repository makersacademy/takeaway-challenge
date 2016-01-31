require_relative 'order'
require_relative 'take_away_ui'

class Basket

attr_reader :selection, :menu_choice

  def initialize(selection=[], menu_choice= ItalianMenu.new(:dinner, :all).dishes)
    @selection = selection
    @menu_choice = menu_choice
  end

  def itemised_bill
    look_up_prices.each_with_index {|meal, index| meal << meal[1..2].inject(:*)}
  end

  private

  def look_up_prices
    selection.each{|full_order| full_order << menu_choice[full_order[0].to_sym]}
  end

  def total_bill
    itemised_bill.transpose.last.inject(:+)
  end




end
