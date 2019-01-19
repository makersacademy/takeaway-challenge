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

end
