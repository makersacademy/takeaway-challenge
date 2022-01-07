require 'restaurant'
require 'order'

describe Restaurant do
  before :all do
    @menu = { taco: 5, pasta: 10, pizza: 15, burger: 3, golden_taco: 999 }
  end
  before :each do
    @order = double('order', items: [:taco, :pasta, :pizza, :pasta, :pasta])
    @empty_order = double('empty_order', items: [])
    @invalid_order = double('invalid_order', items: [:taco, :glue, :scissors, :boa_constrictor])
  end
  subject { described_class.new(@menu) }

  describe '.new' do
    it 'takes a menu as an argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end 
  end

  describe '#menu' do
    it 'returns the menu given on creation' do
      expect(subject.menu).to eq(@menu)
    end
    it 'returns a copy of the menu' do
      menu_copy = subject.menu
      menu_copy[:taco] = 0
      expect(subject.menu[:taco]).not_to eq(0)
    end
  end

  describe '#order_total' do
    it 'returns 0 for an empty order' do
      expect(subject.order_total(@empty_order)).to eq(0)
    end
    it 'returns the total cost of an order' do
      expect(subject.order_total(@order)).to eq(50)
    end
    it 'raises an error if an item is not on the menu' do
      expect { subject.order_total(@invalid_order) }.to raise_error RuntimeError
    end
  end

  describe '#delivery_time' do
    it 'returns an instance of Time' do
      expect(subject.delivery_time).to be_an_instance_of(Time)
    end
    it 'returns a time in the future' do
      expect(subject.delivery_time).to be > Time.now
    end
  end

  describe '#place_order' do
    it 'raises an error if an item is not on the menu' do
      expect { subject.place_order(@invalid_order) }.to raise_error RuntimeError
    end
    it 'raises an error if the order is empty' do
      expect { subject.place_order(@empty_order) }.to raise_error 'Order must contain at least one item'
    end
  end
end
