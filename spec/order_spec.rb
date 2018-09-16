require 'order'

describe Order do
  let(:mockmenu)    { double(:mockmenu) }
  let(:mockprinter) { double(:mockprinter) }
  let(:mockdish1)   { double(:mockdish, name: "mock1", price: 2) }
  let(:mockdish2)   { double(:mockdish, name: "mock2", price: 2) }
  let(:mockdish3)   { double(:mockdish, name: "mock3", price: 2) }
  subject           { described_class.new(mockmenu, mockprinter) }

  describe 'instantiation' do
    it '@basket is an empty array' do
      expect(subject.basket).to eq([])
    end

    it '@printer is set to mock printer' do
      expect(subject.printer).to eq(mockprinter)
    end

    it '@menu is set to mock menu' do
      expect(subject.menu).to eq(mockmenu)
    end
  end

  describe '#add' do
    before do
      allow(mockmenu).to receive(:list).and_return([mockdish1, mockdish2])
    end

    context 'dish not in menu' do
      it 'raises error' do
        expect { subject.add("mock3") }.to raise_error("Dish not in menu!")
      end
    end

    context 'dish not already in basket' do
      it 'adds hash with dish and given qty to @basket' do
        subject.add("mock2", 3)
        expect(subject.basket).to eq([{ dish: mockdish2, qty: 3 }])
      end

      it 'adds hash with dish and default qty to @basket' do
        subject.add("mock2")
        expect(subject.basket).to eq([{ dish: mockdish2, qty: 1 }])
      end
    end

    context 'dish already in basket' do
      before do
        basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 2 }]
        allow(subject).to receive(:basket).and_return(basket_value)
      end

      it 'updates hash with given quantity' do
        new_basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 5 }]
        subject.add("mock2", 3)
        expect(subject.basket).to eq(new_basket_value)
      end

      it 'updates hash with default quantity' do
        new_basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 3 }]
        subject.add("mock2")
        expect(subject.basket).to eq(new_basket_value)
      end
    end
  end

  describe '#display' do
    before do
      allow(mockprinter).to receive(:format_order)
      allow(mockprinter).to receive(:format_total)
      basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 2 }]
      allow(subject).to receive(:basket).and_return(basket_value)
    end

    it 'adds subtotals to hashes in @basket' do
      subject.display
      new_basket_value = [{ dish: mockdish1, qty: 1, subt: 2 }, { dish: mockdish2, qty: 2, subt: 4 }]
      expect(subject.basket).to eq(new_basket_value)
    end

    it 'updates total based on subtotals in hash' do
      subject.display
      expect(subject.total).to eq(6)
    end

    it 'calls printer.format_order for each hash and printer.format_total' do
      2.times { expect(mockprinter).to receive(:format_order) }
      expect(mockprinter).to receive(:format_total)
      subject.display
    end
  end

  describe '#check_total' do
    it 'returns true if argument matches total' do
      allow(subject).to receive(:total).and_return(1995)
      expect(subject.check_total(19.95)).to eq(true)
    end
    it 'returns false if argument does not match total' do
      allow(subject).to receive(:total).and_return(1995)
      expect(subject.check_total(20.0)).to eq(false)
    end
  end
end
