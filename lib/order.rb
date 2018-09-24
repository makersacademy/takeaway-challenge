class Order

  attr_reader :list, :total

  def initialize
    @list = []
    @total = total
  end

  def add(dish,amount)
    return @list << {name: dish[:name], price: dish[:price], amount: amount} if @list.select{|item| item[:name] == dish[:name]}.empty?
    @list.each do |item|
      item[:amount] = amount + item[:amount] if item[:name] == dish[:name]
    end
  end

  def total
    sum = 0
    @list.each { |dish| sum += dish[:price] * dish[:amount] }
    sum
  end

end
