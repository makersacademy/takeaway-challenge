require "takeaway"

describe Takeaway do

  let(:menu) { double :menu, :menu_to_str => true }
  let(:order) { double :order, :publish_order => true, :confirm_order => true, :show_all_orders => true }
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  it "Feature 1: delegates to Menu class - a request to menu to display the menu" do
    expect(menu).to receive(:publish_menu)
    takeaway.publish_menu
  end

  it "Feature 2: delegates to to Order class - a request to order to show itself" do
    expect(order).to receive(:publish_order)
    takeaway.publish_order
  end

  it "Feature 3: delegates to Order class - a request to order to confirm itself" do
    expect(order).to receive(:confirm_order)
    takeaway.confirm_order
  end

  it "Feature 4: delegates to Order class - the show all orders so far" do
    expect(order).to receive(:show_all_orders)
    takeaway.show_all_orders
  end

end
