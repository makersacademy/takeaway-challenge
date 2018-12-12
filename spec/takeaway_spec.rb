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
      allow(menu_double).to receive(:price).and_return(10)
      allow(user_input_double).to receive(:ask).and_return(true)
      allow(user_input_double).to receive(:quantity).and_return(2)
      allow(order_double).to receive(:add).and_return("steak" => { "quantity" => 2, "price" => 10 })
      expect(takeaway.order_from_menu).to eq order_double
    end
    # TODO add tests when the user does not ask for anything

  end

end
