class Takeaway
  attr_reader :dishes
  attr_reader :order

  def initialize
@dishes = []
@order = []

def dishes
@dishes =
[
  { name: "Pizza" , price: "£15.50" },
  { name: "Burger" , price: "£16.30" },
  { name: "Pasta" , price: "14.20" },
  { name: "Sushi" , price: "£14.60" },
  { name: "Noodles" , price: "£15.20" }
]

end
end

def select(name)
  @order << name
  return @order
end

def volume
  ordered_number = @order.each_with_object(Hash.new(0)) { |name, hash| hash[name] += 1 }

ordered_number.map { |item, quantity| quantity.to_int }

  end

# def total 
  #values into integers from orginial dishes
  #multiply value


end


  # @order.each{|item| @order.counts(item)}
