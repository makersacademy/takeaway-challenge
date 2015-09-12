require "./lib/order"
require "./lib/restaurant"
require "./lib/menu"
require "./lib/dish"

describe Order do

  subject do
    customer_name = "Sarah"
    customer_phone_number = "0123456789"
    dishes = [Dish.new("Burger", 8)]
    Order.new(customer_name, customer_phone_number, dishes)
  end

  it "has customer name" do
    expect(subject.customer_name).to eq("Sarah")
  end

  it "has customer phone number" do
    expect(subject.customer_phone_number).to eq("0123456789")
  end

  it "has array of dishes" do
    expect(subject.dishes[0].name).to eq("Burger")
    expect(subject.dishes[0].price).to eq(8)
  end

end