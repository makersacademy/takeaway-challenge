class Menu

  attr_reader :dishes

  def initialize
    @dishes = {burger: 9, fries: 3, sandwich: 6}
  end

  def display_menu
    @dishes.map { |k,v| "#{k} - #{v}" }.join(", ")
  end

  # def check_price(item)
  #   @dishes[item]
  # end


end
