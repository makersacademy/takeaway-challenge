require 'order'

describe Order do

  let(:subject) { described_class.new(fake_menu) }
  let(:fake_menu) { double :menu, menu: {
    "Chicken" => 4.05,
    "Chips" => 2.07}}

  it { is_expected.to be_a Order }

  describe '#print_menu' do
    it' is expected to print the menu items' do
      expect { subject.print_menu }.to output("Chicken, £4.05\nChips, £2.07\n").to_stdout
    end
  end

  describe '#select(selection, number)' do
    it { is_expected.to respond_to(:select).with(2).arguments }

    it 'raises an error if the item is not on the menu' do
      expect { subject.select("TV", 1) }.to raise_error 'TV is not on the menu'
    end

    it 'adds selection to selections if item on menu' do
      subject.select("Chips", 2)
      expect(subject.selections).to eq ["Chips", "Chips"]
    end

    it 'prints total cost so far after each select' do
      expect { subject.select("Chicken", 2) }.to output("The total cost of your order is now £8.1\n").to_stdout
    end
  end

  describe '#remove(selection)' do
    it 'raises an error if item not previously selected' do
      expect { subject.remove("Chips") }.to raise_error 'Chips was not previously selected'
    end

    it 'removes item from selection if previously selected' do
      subject.select("Chicken", 1)
      subject.remove("Chicken")
      expect(subject.selections).to eq []
    end

    it 'subtracts the price of the meal from total cost' do
      subject.select("Chips", 2)
      subject.remove("Chips")
      expect(subject.cost).to eq 2.07
    end
  end

  describe '#view_selections' do
    it 'raises an error if not selected any items' do
      expect { subject.view_selections }.to raise_error 'No items have been selected'
    end

    it 'shows selections if one or more item selected' do
      subject.select("Chicken", 2)
      subject.select("Chips", 1)
      expect { subject.view_selections }.to output("Chicken\nChicken\nChips\n").to_stdout
    end
  end

  describe '#confirm' do
    it 'is expected to respond to confirm' do
      expect(subject).to respond_to :confirm
    end
  end
end
