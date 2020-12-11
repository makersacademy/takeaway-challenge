require 'restaurant'

describe Restaurant do
  let(:dishes_hash) { { 'chicken tikka massala' => 6, 'hawaian pizza' => 6, 'beef noodles' => 5 } }
  let(:menu_double) { double :menu, dishes: dishes_hash }
  let(:menu_class_double) { double :menu, new: dishes_hash }
  let(:plate) { "chicken tikka massala" }
  let(:quantity) { 2 }
  let(:price) { 6 }

  let(:order_double) { double :order, add_item: plate, total_bill: ( "Total: £#{quantity * price}") }
  let(:text_double) { double :text, send: true }
  let(:plate) { "chicken tikka massala" }

  subject(:restaurant) { Restaurant.new(menu_double, order_double, text_double) }


  it 'creates a Restaurant class instance' do
    expect(restaurant).to be_instance_of(Restaurant)
  end

  it 'is initialized with 3 arguments' do
    expect(Restaurant).to respond_to(:new).with(3).arguments
  end

  describe '.total method' do
    it 'shows the total amount to be paid' do
      restaurant.order.add_item(plate, quantity)
      expect(restaurant.order.total_bill(menu_double)).to eq('Total: £12')
    end
  end

  describe '.finalise method' do
    it 'sends a confirmation sms if trolley sum matches total bill' do
      expect(restaurant).to receive(:correct_amount?).and_return(true)
      expect(restaurant).to receive(:send_text).and_return(true)
      restaurant.finalise
    end

    it 'raises an error when trolley sum amount does not match total bill' do
      expect(restaurant).to receive(:correct_amount?).and_return(false)
      expect { restaurant.finalise }.to raise_error "Error: sum of dishes in order does not match total bill!"
    end
  end

end
