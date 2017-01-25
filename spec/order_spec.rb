require 'order'

ITEMS_LIST = [  {:dish=>"Supa Minestrone", :qty=>3},
                {:dish=>"Margherita", :qty=>3} ]
UNIT_PRICES = [ {:dish=>"Supa Minestrone", :price=>1},
                {:dish=>"Margherita", :price=>1} ]
TEST_MESSAGE = "Text Message"

describe Order do
  let(:message){double("message")}
  let(:menu){double("menu")}
  subject(:order){described_class.new(ITEMS_LIST, message, menu)}

  describe '#calculate_total' do
    it {is_expected.to respond_to(:calculate_total)}

    it 'calculates order total amount' do
      allow(menu).to receive(:printer).and_return(UNIT_PRICES)
      expect(order.calculate_total).to eq(6)
    end
  end

  describe '#confirmation' do
    it {is_expected.to respond_to(:confirmation)}

    it 'confirms the order with a sms' do
      expect(message).to receive(:send_message)
      order.confirmation
    end
  end
end
