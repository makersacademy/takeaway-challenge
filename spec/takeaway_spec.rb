require 'takeaway'
require 'order'

describe Takeaway do
    let(:store) { Takeaway.new({ "Chicken Curry" => 6.00 }) }

it 'allows the store to see a list of dishes' do
    expect(store).to respond_to :print_dishes
end

it 'prints a list of dishes with the price' do
    expect {store.print_dishes}.to output("Chicken Curry - £6.00\n").to_stdout
end

it "totals an for a customer " do
    expect(store).to respond_to :total_order 
end

it "gives the customer the total" do
    new_store = Takeaway.new({ "Chicken Curry" => 6.00, "Rice" => 3.00 })
    order = Order.new
    expect(new_store.total_order(order.make_order("Chicken Curry", "Rice"))).to eq 9.00 
end

end