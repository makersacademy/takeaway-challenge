class Basket
  def initialize(basket: [])
    @basket = basket
  end

  def add(order)
    @basket.append(order)
  end

  def viewBasket
    return menu_string_constructor(@basket)
  end

  def basket
    return @basket
  end

  def reciept
    return "#{viewBasket}\n\nTotal: #{@basket.inject(0) {|result, element| result + element[:price]}}"
  end

  private

  def menu_string_constructor(iterable)
    string = ""
    iterable.each do |item|
      string += "#{item[:name]} : £#{item[:price]}\n"
    end
    return string
  end
end
