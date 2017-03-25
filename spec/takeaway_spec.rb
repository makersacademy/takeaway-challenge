require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'initializes with an optional argument' do
    expect{described_class.new(double(:menu))}.not_to raise_error(ArgumentError)
  end

  describe '#print_menu' do
    specify{ expect{ takeaway.print_menu }.to output.to_stdout }
  end

  describe '#select_dish' do
      let(:dish) { double(:dish) }
      let(:amount) { double(:amount) }

    it 'returns the selected dish' do
      expect(takeaway.select_dish(dish, amount)). to eq "#{amount}x #{dish} added to your basket"
    end

    it 'creates a new order' do
      takeaway.select_dish(dish, amount)
      expect(takeaway.order).to be_truthy
    end
  end

end
