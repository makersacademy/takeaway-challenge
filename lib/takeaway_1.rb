class TakeAway

  attr_reader :dishes

  def initialize
    @dishes = { hotdog: 5.00, fries: 3.50 }
  end

  def print_menu
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end


end
