require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:customer) { double('customer') }
  menu_option = { lemon_chicken: 5.89 }

  describe '#initialize' do

    it "has an empty array of items on initialization" do
      expect(order.order_items).to be_empty
    end

  end

  describe '#save_items' do

    it "adds an item and quantity to the order object" do
      allow(order).to receive(:gets).and_return('lemon chicken', '2', '')
      allow(menu_option).to receive(:options).and_return(menu_option)
      order.save_items(menu_option)
      expect(order.order_items).to eq({ lemon_chicken: 2 })
    end

  end


end
