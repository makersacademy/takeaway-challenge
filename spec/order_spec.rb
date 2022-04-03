require 'order'

describe Order do
  let(:menu) { double "Menu" }
  let(:current_order) { described_class.new(menu) }

  it { is_expected.to respond_to :show_menu }

  describe "#add_to_order" do
    it 'should be able to add items to an order' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      expect { current_order.item_list }.to output("1x Fried Rice £6.00\n").to_stdout
    end
  end

  describe "#finish_order" do
    it 'should be able to finish placing an order of items from the menu, which would then remove the items so that a new order can be placed' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      current_order.finish_order
      expect(current_order.item_list).to eq Hash.new { 0 }
    end
  end

  describe "#receipt" do
    it 'should give a receipt after a order has been placed' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      current_order.add_to_order(0,1)
      expect { current_order.finish_order }.to output("Thank you for ordering at Su's Takeaway\nYour order today was:\n2x Fried Rice £12.00\nThe total amount for this order is £12.00\n").to_stdout
    end
  end

  describe "#dish_name" do
    it 'should show the name of a dish using the given index' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      expect(current_order.dish_name(0)).to eq "Fried Rice"
    end 
  end 
  
  describe "#item_list" do
    it 'shows a list of the items ordered' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      expect { current_order.item_list }.to output("1x Fried Rice £6.00\n").to_stdout
    end
  end

  describe "#total_cost" do
    it 'works out the cost of the order' do
      allow(menu).to receive(:list).and_return({ "Fried Rice" => 6.0 })
      current_order.add_to_order(0,1)
      expect(current_order.total_cost).to eq(6)
    end
  end
end
