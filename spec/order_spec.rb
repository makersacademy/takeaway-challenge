require 'order'

describe Order do
  let(:mockmenu)    { double(:mockmenu) }
  let(:mockprinter) { double(:mockprinter) }
  let(:mockdish1)   { double(:mockdish, name: "mock1", price: 1) }
  let(:mockdish2)   { double(:mockdish, name: "mock2", price: 1) }
  let(:mockdish3)   { double(:mockdish, name: "mock3", price: 1) }
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

  describe '#search_basket' do
    before do
      allow(subject).to receive(:basket).and_return([{ dish: mockdish1 }, { dish: mockdish2 }])
    end

    it 'returns true if dish is inside @basket' do
      expect(subject.search_basket(mockdish2)).to eq(true)
    end

    it 'returns false if dish is not inside @basket' do
      expect(subject.search_basket(mockdish3)).to eq(false)
    end
  end

  describe '#search_menu' do
    before do
      allow(subject.menu).to receive(:list).and_return([mockdish1, mockdish2])
    end
    it 'returns dish obj if present in menu.list' do
      expect(subject.search_menu("mock2")).to eq(mockdish2)
    end

    it 'returns nil if dish obj not present in menu.list' do
      expect(subject.search_menu("mock3")).to eq(nil)
    end
  end

  describe 'add_entry' do
    it 'adds dish object and  specified qty as hash inside @basket array' do
      subject.add_entry(mockdish1, 3)
      expect(subject.basket).to eq([{ dish: mockdish1, qty: 3 }])
    end

    it 'adds dish object and default qty 1 as hash inside @basket array' do
      subject.add_entry(mockdish1)
      expect(subject.basket).to eq([{ dish: mockdish1, qty: 1 }])
    end
  end

  describe 'update_entry' do
    before do
      basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 2 }]
      allow(subject).to receive(:basket).and_return(basket_value)
    end

    it 'updates qty value with default argument for existing dish obj in @basket' do
      new_basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 5 }]
      subject.update_entry(mockdish2, 3)
      expect(subject.basket).to eq(new_basket_value)
    end

    it 'udpdate qty value with argument for existing dish obj in @basket' do
      new_basket_value = [{ dish: mockdish1, qty: 1 }, { dish: mockdish2, qty: 3 }]
      subject.update_entry(mockdish2)
      expect(subject.basket).to eq(new_basket_value)
    end
  end
end
