require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new( "Salad", "Text") }

  it 'responds to add_dish' do
    expect(order).to respond_to(:add_dish)
  end

  # allow(menu).to receive(:print_menu).and_return(:printed_menu)
  #   expect(order.read_menu).to eq :printed_menu

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
    order.completed_order("soup", 2)
    expect(order.total_to_pay).to eq 6
  end

  it "raises an error if amount given does not match total_to_pay" do
    order.add_dish("pasta")
    expect { order.payment(5) }.to raise_error "Please check the amount, does not match total!"
  end

end
