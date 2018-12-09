require 'takeaway'

describe Takeaway do

  let(:menu_double) { double(:menu) }
  let(:order_double) { double(:order) }
  let(:user_input_double) { double(:user_input) }
  let(:message_double) { double(:message) }
  subject(:takeaway) { described_class.new(menu_double, user_input_double, order_double, message_double) }

  it 'instructs the menu to display its contents' do
    allow(menu_double).to receive(:display).and_return({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
    expect(takeaway.display_menu).to eq({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
  end

  describe '#order_from_menu' do

    it 'returns the order' do
      allow(takeaway).to receive(:display_menu).and_return({ "steak" => 10 })
      allow(user_input_double).to receive(:ask).and_return(true)
      allow(user_input_double).to receive(:quantity).and_return(2)
      allow(order_double).to receive(:add).and_return("steak" => 2)
      expect(takeaway.order_from_menu).to eq order_double
    end

  end

  describe '#total_to_pay' do

    it 'returns how much the user has to pay for the order' do
      allow(order_double).to receive(:total_to_pay).and_return(50)
      expect(takeaway.total_to_pay).to eq 50
    end

  end

  describe '#send_message' do

    it 'sends a message to the user to confirm that the order has been placed' do
      allow(message_double).to receive(:send).and_return(true)
      expect(takeaway.send_message).to eq true
    end
  end

end
