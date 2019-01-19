require 'order'

Rspec.describe Order do

  let(:food) { double :food }

  it "orders food from the menu" do
  expect (subject.order_food(food)). to eq food
  end
end
