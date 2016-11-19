require './lib/order'

describe Order do

it "should make an order" do
expect(subject.make_order({"jellyfish" => 3})).to eq [{"jellyfish" => 5}, {"jellyfish" => 5}, {"jellyfish" => 5}]
end

it "should be able to show the complete order price" do
  order = Order.new
  order.make_order("sandwich" => 2)
  order.make_order("jellyfish" => 3)
  order.complete_order
  expect(order.total).to eq 21
end



end
