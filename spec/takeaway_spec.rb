require 'takeaway'

describe Takeaway do

  subject(:takeaway) {Takeaway.new}
  subject(:menu) {Menu.new}
  let(:seafood) {double :seafood_pizza}

  it 'reads a menu' do
  expect(takeaway.read_menu).to eq Menu::DEFAULT_MENU
  end

 it "add order" do
   takeaway.add_order(:seafood,1)
   expect(takeaway.basket[-1]).to eq :seafood
 end

 it "checkout" do
   takeaway.add_order(:seafood,1)
   takeaway.add_order(:garlic_bread,2)
   expect(takeaway.checkout).to eq 24
   expect(takeaway.complete?).to eq true
 end

 it "has no order" do
   expect{takeaway.checkout}.to raise_error "No order yet."
 end

 it "check total" do
   expect{takeaway.complete?}.to raise_error "Bill is not correct."
end

end
