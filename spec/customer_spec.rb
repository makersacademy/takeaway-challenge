require 'customer'
require 'diner'

describe Customer do
  let(:customer) {described_class.new}
  let(:diner) {double(Diner.new)}


  describe '#view_menu' do
    before {allow(customer).to receive(:view_menu)}
    before {allow(diner).to receive(:print_items)}
    it 'is able to view the menu' do
      customer.view_menu
    end
  end

  describe '#order_items' do
    before{customer.view_menu}
    it 'is able to specify items for an order' do
      expect(customer).to respond_to(:order_items).with(2).arguments
    end

    it 'increments the total after items are specified' do
      customer.order_items(4, "Pizza")
      expect(customer.order_total).to eq 12.00
    end
  end

  # describe '#confirm_order' do
  #   before {allow(customer).to receive(:confirm_order)}
  #   before {allow(customer).to receive(:send_message)}
  #   it 'sends a text upon order confirmation' do
  #     customer.confirm_order
  #     expect(customer).to receive(:send_message) {"Thanks for your order! Your food will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"}
  #   end
  # end

end
