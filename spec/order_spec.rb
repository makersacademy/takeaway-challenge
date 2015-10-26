require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'should allow you to see the menu' do
    expect(order.see_menu).to eq Menu::DEFAULT_MENU
  end

  context "when an order is placed" do
    describe "#place_order" do
      it 'should allow you select some number of several available dishes' do
        message = "your order has been successfully placed"
        expect(order.place_order(["dumplings"],[3])).to eq message
      end

      it 'should display the total of your order' do
        order.place_order(["dumplings"])
        expect(order.total).to eq((order.see_menu["dumplings"]))
      end

      it 'should raise an error if the order is not in the menu' do
        message = "Sorry but your order is currently not on the menu"
        expect{order.place_order(["eggs"],[1])}.to raise_error(message)
      end
    end
  end

  context "when you have finished ordering" do
    describe "#finish_order" do
      it 'should raise an error if the sum does not match the actual total' do
        message = "The amount given does not match the actual total"
        expect{order.finish_order(5)}.to raise_error(message)
      end
    end
  end

end
