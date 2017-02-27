require 'dishes'
require'calculator'
require 'order'

class Total < Calculator
  include Dishes

  attr_reader :user_selection, :user_total

  def initialize(*user_selection)
    @user_selection = user_selection
  end

  def check
    raise "Total incorrect. Please re-calculate." unless totals_equal?
  end

  def totals_equal?
    true
  end


end
