require 'restaurant'
require 'menu'
describe Restaurant do
  subject(:takeaway) { described_class.new }
  describe 'order tests' do

    it 'has an order in basket once placed' do
      takeaway.order('curry', 1, 1)
      expect(takeaway.basket).to include ['curry', 1]
    end

    it 'shows the total' do
      takeaway.order('curry', 1, 1)
      takeaway.order('pasta', 1, 3)
      expect(takeaway.total).to eq 4
    end

    it 'raise an error if expect_total different than total' do
      error = "Hey it should be 1.0 not 2"
      expect { takeaway.order('curry', 1, 2) }.to raise_error error
    end
  end

  describe 'pretty prints basket and total for the client' do
    before do
      subject.order('curry', 1, 1)
      subject.order('pasta', 1, 3)
    end
    specify { expect { subject.basket_summary }.to output("curry\n1.0\npasta\n3.0\n\"Total: 4.0\"\n").to_stdout }
  end

  describe 'pretty prints todays menu for the client' do
    specify { expect { subject.todays_menu }.to output("curry\n1.0\npasta\n3.0\nbasta\n2.5\n\"So... What would you like? It is all fairly fresh\"\n").to_stdout }
  end

  it 'sends a payment confirmation text message' do
    message = "Your order is complete and will arrive at #{(Time.new + 3600).strftime("%H:%M:%S")}, prepare £1.0 to pay the driver"
    expect(takeaway).to receive(:send_text).with(message)
    takeaway.order('curry', 1, 1)
    takeaway.checkout
  end
end
