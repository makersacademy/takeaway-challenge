require 'restaurant'

describe Restaurant do
  let(:dishes_hash) { { 'chicken tikka massala' => 6, 'hawaian pizza' => 6, 'beef noodles' => 5 } }
  let(:menu_double) { double :menu, dishes: dishes_hash }
  let(:menu_class_double) { double :menu, new: dishes_hash }
  let(:plate) { "chicken tikka massala" }
  let(:quantity) { 2 }
  let(:price) { 6 }

  let(:order_double) { double :order, add_item: quantity }
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
      restaurant.order.total_bill(dishes_hash)
      expect(restaurant.total).to eq("Total: £12")
    end
  end

  # describe '.correct_amount?' do
  #   it 'checks whether the trolley sum matches the total bill' do
  #     expect(restaurant).to respond_to(:correct_amount?).with(1).arguments
  #     amount = £12
  #     order_double.add_item(plate, quantity)
  #     order_double.total_bill(menu_double)
  #     expect(restaurant.correct_amount?(amount)).to eq(true)
  #   end
  # end

  describe '.finalise method' do
    it 'sends a confirmation sms if trolley sum matches total bill' do
      restaurant.order.add_item(plate, quantity)
      amount = 12
      expect(restaurant.finalise(amount)).to eq(true)
    end


    it 'raises an error when trolley sum amount does not match total bill' do
      restaurant.order.add_item(plate, quantity)
      amount = 10
      expect { restaurant.finalise(amount) }.to raise_error "Error: sum of dishes in order does not match total bill!"
    end
  end

  end
