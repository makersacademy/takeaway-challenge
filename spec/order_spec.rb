require './docs/order'

describe Order do
  let(:menu) { double menu: { "Haddock" => 5, "Cod" => 6 } }
  let(:time) { Time.parse("2018-01-20 20:17:40") }
  # let(:basket) { { } }
  subject(:order) { described_class.new(menu) }

  describe '#intialize' do
    it 'should have an instance of the menu class' do
      expect(order.menu).to eq menu
    end
    it 'should have an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  describe '#display_menu' do
    it 'should display the menu' do
      allow(menu).to receive(:show_menu) { ["Haddock - £5", "Cod - £6"] }
      expect(order.display_menu).to eq menu.show_menu
    end
  end

  describe '#add_dish' do
    it 'should add the selection to the basket' do
      order.add_dish("Haddock", 2)
      expect(order.basket).to include("Haddock" => 2)
    end
  end

  describe '#cost' do
    it 'should multiply the quantity added to the order by the menu price' do
      order.add_dish("Haddock", 2)
      expect(order.cost).to eq "Order total: £10"
    end
  end

  describe '#enter_payment' do
    it 'should return the payment amount entered' do
      expect(order.enter_payment(10)). to eq "Submitting your payment of £10"
    end
  end

  describe "#place_order" do
    it 'should return true if the payment amount equals the order cost' do
      allow(order).to receive(:cost) { 10 }
      allow(order).to receive(:enter_payment).with(1) { 10 }
      time_new = "21:17"
      expect(order.place_order(10, 10, time)).to eq "Thanks for your order. It will be delivered to you by #{time_new}"
    end
    it 'should raise an error if the payment amount is incorrect' do
      allow(order).to receive(:cost) { 10 }
      allow(order).to receive(:enter_payment).with(1) { 5 }
      time_new = "21:17"
      expect { order.place_order(10, 5, time_new) }.to raise_error ("Unable to place order. Please enter the correct payment amount.")
    end
  end

  # describe '#send_SMS' do
  #   it 'should tell SMS to send an SMS' do
  #
  #   end
  # end

end
