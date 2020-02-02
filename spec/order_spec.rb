require 'order'
require 'menu'
 
describe Order do
  subject(:order) { described_class.new(menu) }
# verifying doubles in rspec-- then change double to instance double below .using instand and the n strings that has to mach the class
# let(:menu) { double(:menu)} will change to below
let(:menu) { instance_double("Menu") }

# let(:menu) { double(:menu)}

let(:dishes) do
  {
    sausage: 2,
    chips: 1
  }
end
# mocking-- but it doesn't have has_dish? method so we go to line 4 above
before do 
  allow(menu).to receive(:has_dish?).with(:sausage).and_return(true)
  allow(menu).to receive(:has_dish?).with(:chips).and_return(true)

  allow(menu).to receive(:price).with(:sausage).and_return(3.00)
  allow(menu).to receive(:price).with(:chips).and_return(2.50)
end

  it "select several dishes from the menu" do
   create_order
   expect(order.dishes).to eq(dishes)
  end
  it "doesn't allow items to be added if not on the menu" do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 1) }.to raise_error NoItemError, "Fish is not in the menu"
  end
  it 'calculates the total for the order ' do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end
  # creat order for refactoring the test
  def create_order
    order.add(:sausage, 2)
    order.add(:chips, 1)
  end
end 
