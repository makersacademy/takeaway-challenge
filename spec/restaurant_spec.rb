require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }
  let(:order) { double :order, :current_order => [{ 'Spring rolls' => 5.00 }, {'Pho' => 7}] }

  it 'should respond to #read_menu with a list of dishes' do
    expect(restaurant.read_menu).to eq Menu.new.food_options
  end

  it { is_expected.to respond_to(:make_selection).with(2).arguments }

  #introduce stubs here to fake an order
  it 'is expected to return order summary on request' do
    restaurant.make_selection('Spring rolls', 2)
    restaurant.make_selection('Pho')
    expect(restaurant.order_summary).to eq order.current_order
  end

  describe '#place_order' do

    #failing test trying to use stubs to prevent text from sending before introducing function.
    it 'should send text message' do
      time = Time.new
      allow(restaurant).to receive(:place_order)
      expect(restaurant).to receive(:place_order).with("Your order will arrive at #{time.hour + 1}.#{time.min}")
    end
  end

end
