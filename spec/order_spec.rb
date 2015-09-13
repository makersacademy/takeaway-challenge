require "./lib/order"
require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Order do

  subject do
    customer_name = "Sarah"
    customer_phone_number = "0123456789"
    burger = Dish.new("Burger", 8)
    pizza = Dish.new("Pizza", 10)
    order_dishes = {burger => 1,
                    pizza => 2}
    Order.new(customer_name, customer_phone_number, order_dishes)
  end

  it "has customer name" do
    expect(subject.customer_name).to eq("Sarah")
  end

  it "has customer phone number" do
    expect(subject.customer_phone_number).to eq("0123456789")
  end

  it "has hash of dishes" do
    expect(subject.order_dishes.keys).
      to match_array [Dish.new("Burger", 8), Dish.new("Pizza", 10)]
  end

  it "returns total amount" do
    expect(subject.total_amount).to eq(28)
  end

end

