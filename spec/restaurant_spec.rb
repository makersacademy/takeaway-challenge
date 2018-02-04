require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(menu) }
  let(:menu) { double 'menu' }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }
  let(:printed_test_menu) { "Menu\nDish_1: £3.50\nDish_2: £4.00\n" }
  let(:order) { double 'an order' }
  let(:test_text) { double 'text' } #not using this...

  it "stores a new menu object" do
    expect(restaurant.menu).to eq menu
  end

  describe '#show_menu' do
    it 'returns the printed menu' do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:print).and_return(printed_test_menu)
      expect(restaurant.show_menu).to eq printed_test_menu
    end
  end

  describe '#create_order' do
    it 'creates a new empty order' do
      expect(restaurant.create_order(order)).to eq order
    end
  end

  describe '#checkout' do

    before(:each) do
      restaurant.create_order(order)
      allow(order).to receive(:total).and_return(11.50)
    end

    it 'returns an error if the payment amount is incorrect' do
      message = "Incorrect amount, please check order total"
      expect { restaurant.checkout(11) }.to raise_error message
    end

    it 'sends a confirmation text if the amount is correct' do
      # allow(restaurant).to receive(:send_text)
      expect(restaurant).to receive(:send_text)
      restaurant.checkout(11.50)
    end

  end

end
