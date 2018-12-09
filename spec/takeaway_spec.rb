require 'takeaway'

describe Takeaway do
  let(:menu_double) { double(:menu) }
  let(:order_double) { double(:order) }
  let(:user_input_double) { double(:user_input) }
  subject(:takeaway) { described_class.new(menu_double, user_input_double) }

  it 'instructs the menu to display' do
    allow(menu_double).to receive(:display).and_return({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
    expect(takeaway.display_menu).to eq({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
  end

  describe '#order_from_menu' do

    it 'is aware of the total amount the user has to pay' do
      allow(takeaway).to receive(:display_menu).and_return({ "steak" => 10 })
      allow(user_input_double).to receive(:ask).and_return(true)
      allow(user_input_double).to receive(:quantity).and_return(2)
      allow(order_double).to receive(:add).and_return("steak" => 2)
      expect(takeaway.order_from_menu).to eq 20
    end

  end
end
