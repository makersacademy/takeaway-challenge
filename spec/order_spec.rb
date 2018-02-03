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

  it "Allows the customer to select a dish" do
    subject.select_dish(dish_1)
    expect(subject.current_order).to eql(dish_1)
  end

  it "Allows the customer to select multiple dishes" do
    subject.select_dish(dish_1)
    subject.select_dish(dish_2)
    expect(subject.current_order).to eql([dish_1], [dish_2])
  end

end
