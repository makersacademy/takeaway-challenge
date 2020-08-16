class Menu

  attr_reader :dishes

  def initialize(dishes)

    @dishes = dishes

  end

  def view
    dishes.map { |dish , price | "#{dish} £#{price}" }.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

 end