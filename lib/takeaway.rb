class Takeaway
  def initialize(menu)
    @menu = menu
  end

  attr_reader :menu

  #Have menu be a different class - the takeaway deals with orders, it doesn't also save the dishes and prices.
end