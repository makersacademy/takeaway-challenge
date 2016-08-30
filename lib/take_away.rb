class Takeaway
  attr_reader :basket
  def initialize(menu = Menu.new)
    @main_menu = menu
    @basket = []
  end
  def menu
    main_menu.all
  end

  def order(item, number = 1)
    fail "No such item" unless menu.has_key?(item)
    number.times do
      @basket.push(item => menu.fetch(item))
    end
  end

  def subtotal
    subtotal = 0
    basket.each do |item|
      subtotal += item.values[0]
    end
    subtotal = subtotal.to_s
    subtotal = subtotal.insert(-1, "0") unless subtotal.index(/\.\d\d/)
  end

  def total
    i = 1
    string = "Total cost: £#{subtotal}, contains: "
    basket.each do |item|
      string << item.to_s
      string << ", " if i < basket.length
      i += 1
    end
    string
  end
  private

  attr_reader :main_menu
end
