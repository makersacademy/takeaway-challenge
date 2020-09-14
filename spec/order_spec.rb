require 'order_takeaway'
require 'menu'


describe Order do
subject(:order) {described_class.new(menu) }

let(:menu) { instance_double("Menu") }

let(:dishes) do
    {
        fish: 2,
        beef: 1
    }
end 

before do 
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
    allow(menu).to receive(:has_dish?).with(:beef).and_return(true)

    allow(menu).to receive(:price).with(:fish).and_return(5.00)
    allow(menu).to receive(:price).with(:beef).and_return(6.00)
end 

it "selects several food dishes from menu" do
  order.add(:fish, 2)
  order.add(:beef, 1)
  expect(order.dishes).to eq(dishes)
end

it "it does not add items to the order that are not on the menu" do
  allow(menu).to receive(:has_dish?).with(:chicken).and_return(false)
  expect { order.add(:chicken, 2)}.to raise_error RuntimeError, "chicken is not on the menu!"
end 
 
it "calculates the total for the order" do 
   order.add(:fish, 2)
   order.add(:beef, 1)
   total = 16.00
   expect(order.total).to eq(total)
end
end