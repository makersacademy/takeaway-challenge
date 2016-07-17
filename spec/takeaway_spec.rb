require 'takeaway'

describe Takeaway do

  example_menu = {"Chips"=>3.99, "Naan"=>1.95}
  time = Time.now + (1 * 60 * 60)
  time = time.strftime('%-H:%M')
  msg = "Thank you! Your order was placed and will be delivered before #{time}"
  default_total = 12.9
  example_selection = {:dish => "Chips", :quantity => 2, :price => 3.99}

  let(:csv) { double('CsvReader') }
  let(:order) { double('Order') }

  subject(:takeaway) { described_class.new(order: order, csv: csv) }

  before do
    allow(order).to receive(:select_dish) { default_total }
    allow(order).to receive(:basket) { {"Chips" => 3.99, "Naan" => 1.95} }
    allow(csv).to receive(:menu) { example_menu }
    allow(order).to receive(:total) { default_total }
    allow(order).to receive(:clear_basket)
  end

  it 'Menu csv should exist' do
    expect(File.exist?(Takeaway::DEFAULT_MENU)).to be_truthy
  end

  it 'shows a menu' do
    expect(takeaway.show_menu).to eq example_menu
  end

  describe '#add_to_order' do
    it 'sends message to select dish' do
      expect(order).to receive(:select_dish).with(example_selection)
      takeaway.add_to_order("Chips", 2)
    end

    it 'raises an error when selecting non existant dish from menu' do
      expect{ takeaway.add_to_order("") }.to raise_error('Dish does not exist in menu')
    end
  end

  context 'Message to order' do
    it 'sends message to get total' do
      expect(order).to receive(:total)
      takeaway.view_total
    end

    it 'sends message to view basket' do
      expect(order).to receive(:basket)
      takeaway.view_basket
    end
  end

  describe '#confirm_total' do
    it 'matches the sum for various dishes in order' do
      takeaway.add_to_order("Chips")
      expect(takeaway.confirm_total(default_total)).to eq msg
    end

    it 'raises error if nothing in basket' do
      allow(order).to receive(:basket) { Hash.new }
      expect{ takeaway.confirm_total(default_total) }.to raise_error('Nothing in basket')
    end

    it 'raises error if incorrect total provided' do
      expect { takeaway.confirm_total(100) }.to raise_error('Incorrect total provided')
    end
  end
end
