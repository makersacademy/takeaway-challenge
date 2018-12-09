require 'takeaway'

describe Takeaway do
  let(:menu_double) { double(:menu) }
  let(:user_input_double) { double(:user_input) }
  subject(:takeaway) { described_class.new(menu_double, user_input_double) }

  it 'instructs the menu to display' do
    allow(menu_double).to receive(:display).and_return({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
    expect(takeaway.display_menu).to eq({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
  end

  describe '#order_from_menu' do

    # it 'returns user selection of items and quantities when the menu has one element' do
    #   allow(takeaway).to receive(:display_menu).and_return({ "steak" => 10 })
    #   allow(user_input_double).to receive(:ask).and_return(true)
    #   allow(user_input_double).to receive(:quantity).and_return(2)
    #   expect(takeaway.order_from_menu).to eq({ "steak" => 2 })
    # end
    #
    # it 'returns user selection of items and quantities when the menu has multiple elements' do
    #   allow(takeaway).to receive(:display_menu).and_return({ "steak" => 10, "ravioli" => 20 })
    #   allow(user_input_double).to receive(:ask).and_return(true)
    #   allow(user_input_double).to receive(:quantity).and_return(1)
    #   expect(takeaway.order_from_menu).to eq({ "steak" => 1, "ravioli" => 1 })
    # end
    #
    # it 'returns an empty selection if the user hasnt chosen any items' do
    #   allow(takeaway).to receive(:display_menu).and_return({ "steak" => 10 })
    #   allow(user_input_double).to receive(:ask).and_return(false)
    #   allow(user_input_double).to receive(:quantity).and_return(0)
    #   expect(takeaway.order_from_menu).to eq({})
    # end

  end
end
