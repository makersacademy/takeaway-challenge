class Takeaway

  attr_reader :order

  def initialize(dishes = [{pizza: '£9'}, {pasta: '£7'}])
    @dishes = dishes
    @order = []
  end

  def menu
    @dishes
  end

  def add_to_order(choice)
    @dishes.each { |dish| @order << dish if dish.include?(choice.to_sym)}
  end


end
