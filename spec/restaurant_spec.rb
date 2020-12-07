require 'restaurant'

describe Restaurant do
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:messenger) { Messenger.new }
  let(:restaurant) { Restaurant.new(:menu, :order) }  #still need to add text_messager class

  let(:mock_menu) { { 'chicken tikka massala' => 6, 'hawaian pizza' => 6 } }

  it 'creates a Restaurant class instance' do
    expect(restaurant).to be_instance_of(Restaurant)
  end

  it 'is initialized with 3 arguments' do
    expect(Restaurant).to respond_to(:new).with(2).arguments
  end

  # this test needs fixing
  describe '.total method' do
    it 'shows the total amount to be paid' do
      ex_order = double
      allow(ex_order).to receive(:total_bill).and_return("Total: £12")
      expect(ex_order).to receive(:total_bill)
      restaurant.total
      expect(restaurant.final_bill).to eq("Total: £12")
    end
  end

  describe '.correct_amount?' do
    it 'checks whether the trolley sum matches the total bill' do
      expect(restaurant).to respond_to(:correct_amount?).with(1).arguments
      sum = £10
      expect(restaurant.correct_amount?(sum)).to eq(true)
    end
  end

  # still to complete
  # describe '.finalise method' do
  #   it 'sends a confirmation sms if trolley sum matches total bill' do
  #   end


    it 'raises an error when trolley sum amount does not match total bill' do
      expect { restaurant.finalise }.to raise_error "Error: sum of dishes in order does not match total bill!"
    end


  end
