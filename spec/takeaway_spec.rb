require 'takeaway'

describe Takeaway do
  # before(:each) do
    subject(:takeaway) {Takeaway.new}
    subject(:menu) {Menu.new}
    let(:seafood) {double :seafood_pizza}
  # end

  it 'reads a menu' do
    expect(takeaway.read_menu).to eq Menu::DEFAULT_MENU
  end

  it "orders 2 seafood pizza" do
    takeaway.add_order(:seafood, 2)
    expect(takeaway.basket[-1]).to eq :seafood
    expect(takeaway.basket[-2]).to eq :seafood
  end

  it "checkout" do
    takeaway.add_order(:seafood,1)
    takeaway.add_order(:seafood,1)
    expect(takeaway.checkout).to eq 28
  end

  it "sends confirmation text" do
    takeaway.add_order(:seafood, 2)
    takeaway.checkout
    # allow(takeaway).to receive(:checkout)
    expect(takeaway.confirm_order).to eq (true)
  end

end
