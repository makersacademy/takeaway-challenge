require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu, confirmation) }
  let(:menu) { Menu.new }
  let(:confirmation) { Confirmation.new(double :client) }


  it 'responds to add_dish' do
    expect(order).to respond_to(:add_dish)
  end

  it 'updates order when dishes are chosen' do
    order.add_dish("salad", 3)
    expect(order.booking).to include("salad")
  end

  it "raises an error if dish isn't available" do
    expect { order.add_dish("tea") }.to raise_error "This dish is not on the menu"
  end

  it "refurns false if the dish is not on the menu" do
    expect(order.available?("chips")).to be false
  end

  it "summs all dishes chosen" do
    total = 6
    order.completed_order("soup", 2)
    expect(order.total_to_pay).to eq total
  end

  it "raises an error if amount given does not match total_to_pay" do
    order.add_dish("pasta")
    expect { order.payment(5) }.to raise_error "Please check the amount, does not match total!"
  end

end
