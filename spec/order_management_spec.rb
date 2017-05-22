require 'order_management'

describe OrderManagement do

  let(:notification_tool) {double :notification_tool}
  let(:menu) { double :menu }
  let(:lasagna) { double :lasagna}
  subject(:order_management) { described_class.new(notification_tool) }

  before do
    allow(notification_tool).to receive(:send)
    allow(menu).to receive(:items).and_return([lasagna])
    allow(lasagna).to receive(:name).and_return("Lasagna al forno")
    allow(lasagna).to receive(:price).and_return(9)
  end

  it 'should respond to #order_by_commandline' do
    expect(order_management).to respond_to(:order_by_commandline).with(2).arguments
  end

  describe '#order_by_commandline' do

    it 'should raise an error if user orders a dish that is not on the menu' do
      order_hash = { basket: [{ name: "Pizza Tonno", quantity: 2 }], total: 18 }
      expect { order_management.order_by_commandline(order_hash, menu.items) }.to raise_error("Sorry, 'Pizza Tonno' is not on our menu")
    end

    it 'should raise an error if user orders and enters a total that is not the calculated total' do
      order_hash = { basket: [{ name: "Lasagna al forno", quantity: 2 }], total: 14 }
      expect { order_management.order_by_commandline(order_hash, menu.items) }.to raise_error("Sorry, your total was incorrect. Order was not placed")
    end

    it 'returns the correct string at the end' do
      order_hash = { basket: [{ name: "Lasagna al forno", quantity: 2 }], total: 18 }
      expect(order_management.order_by_commandline(order_hash, menu.items)).to eq "Thank you! Your order was placed and will be delivered before "+"#{Time.now.strftime('%H').to_i + 1}"+":"+Time.now.strftime('%M')+". A confirmation was sent to your phone as a text."
    end
  end
end
