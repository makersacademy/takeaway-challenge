require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu_dbl, order: order_dbl) }

  let(:menu_dbl) { double(:menu, print: view_menu_dbl) }
  let(:view_menu_dbl) { "veggie pizza : 5.5" }
  let(:order_dbl) { instance_double("Order", order_total: 17.5) }

  let(:items) { {chicken_curry: 2, veggie_pizza: 1} }

  it "shows the menu with dishes and prices" do
    expect(takeaway.view_menu).to eq(view_menu_dbl)
  end

  it "can place an order of some number of several dishes" do
    expect(order_dbl).to receive(:add_item).twice
    p takeaway.place_order(items)
  end

  context '#view_menu' do

    it "has a list of available items called menu" do
      expect(subject).to respond_to(:view_menu)
    end
  end

  context '#order_total' do

    it "knows the order total" do
      allow(order_dbl).to receive(:add_item)
      total = takeaway.place_order(items)
      expect(total).to eq (17.5)
    end
  end

end
