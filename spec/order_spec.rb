require 'order'

describe Order do
  let(:menu) { double "Menu" }
  let(:current_order) { described_class.new(menu) }

  describe "#add_to_order" do
    it 'should be able to add items to an order' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      expect { current_order.item_list }.to output("1x Fried Rice £6.00\n").to_stdout
    end
  end

  describe "#finish_order" do
    it 'should be able to finish placing an order of items from the menu, which will then work out the total price' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      current_order.finish_order
      expect(current_order.total_cost).to eq(6)
    end
  end

  describe "#receipt" do
    it 'should give a receipt after a order has been placed' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      current_order.add_to_order(0,1)
      expect { current_order.receipt }.to output("Thank you for ordering at Su's Takeaway\nYour order today was:\n2x Fried Rice £12.00\nThe total amount for this order is £12.00\n").to_stdout
    end
  end
end
