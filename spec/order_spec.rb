require "order"

describe Order do

  # let(:dish_1) {double("Beef burger", number: 1, name: "Beef burger", price: 10)}
  # let(:dish_2) {double("Cheese burger", number: 2, name: "Cheese burger", price: 12)}

  it "Allows the customer to select a dish" do
    subject.select_dish(1)
    expect(subject.current_order[0].name).to eql("Beef burger")
  end

  it "Allows the customer to select multiple dishes" do
    subject.select_dish(1)
    dish_two = subject.select_dish(2)
    expect(subject.current_order).to include(dish_two)
  end

end
