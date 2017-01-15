require 'restaurant'
require 'takeaway'
require 'order'

describe Restaurant do
  subject(:restaurant) { described_class.new(Takeaway.new) }

  describe '#initialize' do
    it 'with a menu object' do
      expect(restaurant.menu).to be_a(Menu)
    end

    it 'with a takeaway object' do
      expect(restaurant.takeaway).to be_a(Takeaway)
    end
    # 
    # it 'with a current order that is an order object' do
    #   expect(restaurant.current_order).to be_a(Order)
    # end
  end

  describe '#checkout_order' do
    before do
      restaurant.takeaway.menu.add_dish("Risotto con funghi porcini", 4.25)
      restaurant.takeaway.add("Risotto con funghi porcini", 2)
    end

    it 'fails with insufficient payment' do
      message = "Insufficient payment! Please retry."
      expect { restaurant.checkout_order(8) }.to raise_error(message)
    end

    context 'with a takeaway double' do
      let(:takeaway_dbl) { instance_double("Takeaway") }

      before do
        allow(takeaway_dbl).to receive(:reset)
      end

      it 'instructs the takeaway to reset its order to empty' do
        expect(takeaway_dbl).to respond_to(:reset)
      end
    end
  end

  describe 'send_message' do
    it 'sets message to preset(for now)' do
      message = "Thank you for your custom! Your order will be delivered before #{Time.now.strftime("%R")}."
      expect(restaurant.send_message).to eq message
    end
  end

end
