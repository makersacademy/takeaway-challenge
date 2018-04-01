require 'customer'

describe Customer do

  subject(:customer) { described_class.new }
  let(:item) { double('item') }
  let(:order) { double('order') }

  describe '#view_menu' do
    # it "lets the customer see a list of all menu items with prices" do
    #   output_format = <<~HEREDOC
    #   Sesame prawn toast £5.79
    #   Crispy seaweed £3.99
    #   Spring rolls £2.99
    #   Lemon chicken £5.89
    #   King prawns with cashew nuts £6.99
    #   HEREDOC
    #   expect(customer.view_menu).to eq(output_format)
    # end


  end

  describe "#place_order" do

    it "delegates the placing of an order to the order object" do
      allow(order).to receive(:save_items).with(item).and_return 'order noted'
      expect(customer.place_order).to eq 'order noted'

    end


  end
end
