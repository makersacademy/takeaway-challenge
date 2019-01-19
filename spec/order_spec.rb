require 'order'

RSpec.describe Order do

  let(:food) { double :food }
  let(:quantity) { double :quantity }

  it "orders food from the menu" do
  expect(subject.order_food(food, quantity)).to eq [ {:food => food, :quantity => quantity }   ]
  end

  it "calculates order total" do
    subject.order_food(:pizza, 3)
    expect(subject.total_cost).to eq (18)
  end

  it "checks if the order price is correct" do
    subject.order_food(:pizza, 3)
    expect(subject.correct_cost(18)).to eq true 

end
end
