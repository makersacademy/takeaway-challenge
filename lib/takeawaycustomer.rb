class TakeawayCustomer
  attr_reader :name, :number, :menu, :selections
  def initialize(name, number)
    @name = name
    @number = number
    @menu = Menu.new
    @selections = Hash.new
  end

  def list
    @menu.menu
  end

  def order(item)
    if @selections.has_key?(item)
      @selections[item] += 1
    else
      @selections.store(item, 1)
    end
  end

  def total
    total = 0
    @selections.each { |item, quantity| total += (@menu.menu[item] * quantity) }
    total
  end
end
