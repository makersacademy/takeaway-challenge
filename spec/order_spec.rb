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

  # it "raises an error if sum is not correct" do
  # end

end


#place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".


# xit "should see a list of dishes"
# xit "should be able to see list of dishes with prices"
# xit "should be able to see list of available dishes"
# xit "should be able to select a dish"
# xit "should be able to select more than one dish"
# xit "should only be able to select dish if available"
# xit "should be able to add prices of selected dished"
# xit "should be able to place order"
# xit "should raise an error if sum is not correct"
# xit "should be able to recieve text message when order placed"
