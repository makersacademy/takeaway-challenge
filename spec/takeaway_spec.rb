require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print_menu: shown_menu) }
  let(:order) { double(:order) }
  let(:shown_menu) { "menu items" }

  let(:dishes) { { sushi: 3, ramen: 2 } }

  it "shows the menu" do
    expect(takeaway.show_menu).to eq(shown_menu)
  end

  it "can order quantity of dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
