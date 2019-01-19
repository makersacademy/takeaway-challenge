require 'takeaway'

describe Takeaway do

  subject(:takeaway) {Takeaway.new}
  subject(:menu) {Menu.new}
  let(:seafood) {double :seafood_pizza}

  it 'reads a menu' do
  expect(takeaway.read_menu).to eq Menu::DEFAULT_MENU
  end

 it "add order" do
   takeaway.add_order(:seafood)
   expect(takeaway.order_summary[-1]).to eq :seafood

end

end
