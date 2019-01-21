require "order"

describe Order do 

  let(:dish) {double :dish}
  let(:quantity) {double :quantity}
  it "can select a meal for order" do 
    expect(subject.order_food(dish, quantity)).to eq[{dish: dish, quantity: quantity}]
  end

    it "calculates order total" do
    subject.order_food(:pizza, 3)
    expect(subject.total_cost).to eq (18)
  end


end
