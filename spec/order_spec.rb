require 'order'
describe Order do
subject(:order) { described_class.new(menu)}
# verifying doubles in rspec-- then change double to instance double below .using instand and the n strings that has to mach the class
#let(:menu) { double(:menu)} will change to below
let(:menu) { instance_double("Menu")}

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
end

  it "select several dishes from the menu" do
    order.add(:sausage, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq (dishes)
  end
  it "doesn't allow items to be added if not on the menu" do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 1)}.to raise_error NoItemError, "Fish is not in the menu"
  end
end 