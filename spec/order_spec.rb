require 'order'
require 'vcr'

describe Order do
  subject(:order) { described_class.new }
  let(:customer) { double('customer') }
  let(:total_cost) { double('total cost') }
  let(:phone_num) { double('phone_num') }
  let(:message) { double('message') }
  menu_option = { lemon_chicken: 5.89 }

  describe '#initialize' do

    it "has an empty array of items on initialization" do
      expect(order.order_items).to be_empty
    end

  end

  describe '#save_items' do
    let(:squid){ double('squid') }
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
    it "prints a verification of an order" do
      order_verification = "You ordered:\n 2 x lemon chicken - £5.89 each\n Total: £11.78\n"
      expect{order.check_order(menu_option)}.to output(order_verification).to_stdout

    end
  end

  describe '#confirm_order' do
    it "sends a message confirming the order" do

      allow(customer).to receive(:finish_order)
      allow(order).to receive(:order_total).and_return(17.98)

     VCR.use_cassette('twilio') do
     customer.finish_order(17.98)

 end
      # allow(order).to receive(:order_total).and_return('£11.78')
      # allow(phone_num).to receive(:chomp).and_return(phone_num)
      # allow(order).to receive(:message).and_return(message)
      # allow(order).to receive(:run_twilio).and_return('SMS sent')
      # expect(order.confirm_order).to eq('SMS sent')
    end
  end


end
