require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  let(:amount) { double(:amount) }

  it 'initializes with an optional argument' do
    expect{described_class.new(double(:menu))}.not_to raise_error(ArgumentError)
  end

  describe '#print_menu' do
    specify{ expect{ takeaway.print_menu }.to output.to_stdout }
  end

  describe '#select_dish' do

    it 'returns the selected dish' do
      expect(takeaway.select_dish(dish, amount)). to eq "#{amount}x #{dish} added to your basket"
    end

    it 'creates a new order' do
      takeaway.select_dish(dish, amount)
      expect(takeaway.order).to be_truthy
    end

    it 'sends the dish and amount to the order' do
      takeaway.select_dish(dish, amount)
      expect(takeaway.order).to receive(:add).with(dish, amount)
      takeaway.select_dish(dish, amount)
    end
  end

  describe '#order_exists?' do
    it 'checks whether an order exists' do
      expect(takeaway).to be_complete
    end
  end
end
