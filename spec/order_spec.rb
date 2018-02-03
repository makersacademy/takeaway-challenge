require "order"

describe Order do

  let(:dish_1) {double("Beef Burger", name: "Beef Burger", price: 10)}
  let(:dish_2) {double("Cheese Burger", name: "Beef Burger", price: 12)}

  it "Allows the customer to select a dish" do
    subject.select_dish("Beef Burger")
    expect(subject.current_order[0]).to eql("Beef Burger")
  end

  it "Allows the customer to select multiple dishes" do
    subject.select_dish("Beef Burger")
    subject.select_dish("Cheese Burger")
    expect(subject.current_order).to eql(["Beef Burger", "Cheese Burger"])
  end

end
