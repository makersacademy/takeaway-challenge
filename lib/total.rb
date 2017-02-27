require 'dishes'
require 'calculator'
require 'order'

class Total < Calculator
  include Dishes

  attr_reader :user_selection, :pick

  def initialize(*user_selection)
    pick = user_selection.last
#    @pick = pick
    @user_selection = user_selection
  end

  def check
    raise "Total incorrect. Please re-calculate." unless totals_equal?
  end

  def totals_equal?
  p  pick
    true
  end


end
