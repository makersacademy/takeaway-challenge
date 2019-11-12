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

end
