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

  describe '#check_order' do
    before(:each) do
      order.save_items(menu_option)
    end
    it "prints a verifiction of an order" do
      order_verification = "You ordered:\n 2 x lemon chicken - £5.89 each\n Total: £11.78\n"
      expect{order.check_order(menu_option)}.to output(order_verification).to_stdout

    end
  end


end
