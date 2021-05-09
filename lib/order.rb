class Order
  attr_reader :current
  
  def initialize(current = [])
    @current = current
  end

  def display 
    @current.empty? ? "Empty order" : "#{@current}"
  end

  def add(selected_item, quantity)
    if @current.include?(selected_item)
      @current.each { |item| item[:quantity] += quantity if item[:name] == selected_item[:name] }
    else
      @current << { name: selected_item[:name], price: selected_item[:price], quantity: quantity }
    end
  end

  def total
    total = 0
    @current.each { |item| total += (item[:price] * item[:quantity]) }
    "£#{total}"
  end
end
