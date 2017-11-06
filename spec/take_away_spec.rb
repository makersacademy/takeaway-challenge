require 'take_away'

describe TakeAway do

  let(:menu) { double :menu }

  subject(:take_away) { described_class.new(menu) }

  it 'intialize with menu' do
    expect(TakeAway).to respond_to(:new).with(1)
  end

  it '.selection return an array of hashes' do
    allow(menu).to receive(:list).and_return({ pizza: 12 })
    take_away.select_food('pizza', 3)
    expect(take_away.selection).to eq([{ pizza: 3 }])
  end

  it '#print_menu return list of dishes with price' do
    allow(menu).to receive(:pretty_print).and_return([{ pizza: 12 }, { burger: 8 }])
    expect(take_away.print_menu).to eq([{ pizza: 12 }, { burger: 8 }])
  end

  describe '#select_food' do

    it 'receive 2 arguments' do
      expect(take_away).to respond_to(:select_food).with(2)
    end

    it 'raise error if order not in the menu' do
      allow(menu).to receive(:list).and_return({ pizza: 12 })
      expect { take_away.select_food('pasta') }.to raise_error("Sorry we don't have pasta!")
    end
  end

  describe '#total' do

    it 'return the total' do
      allow(menu).to receive(:list).and_return({ pizza: 12 })
      take_away.select_food('pizza', 2)
      expect(take_away.total).to eq(24)
    end
  end

end
