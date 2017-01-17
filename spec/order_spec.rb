require 'order'

ITEMS_LIST = [{:dish=>"Supa Minestrone", :qty=>3}, {:dish=>"Margherita", :qty=>3}]
TEST_MESSAGE = "Text Message"

describe Order do
  subject(:order){described_class.new(ITEMS_LIST)}
  let(:message){double("message")}
  before :each do
    Menu.send(:remove_const, "FILENAME")
    Menu::FILENAME = "./lib/list_dishes_test.csv"
  end

  describe '#calculate_total' do
    it {is_expected.to respond_to(:calculate_total)}

    it 'calculates order total amount' do
      order.calculate_total
      expect(order.calculated_amount).to eq(6)
    end
  end

  describe '#confirmation' do
    it {is_expected.to respond_to(:confirmation)}

    it 'confirms the order with a sms' do
      allow(order.message).to receive(:send_message).and_return(TEST_MESSAGE)
      expect(order.confirmation).to eq(TEST_MESSAGE)
    end
  end
end
