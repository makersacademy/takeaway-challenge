require 'order'

describe Order do

  let(:dish1){double(:dish1, name: "Dishy1", price: 1.11)}
  let(:dish2){double(:dish2, name: "Dishy2", price: 2.22)}
  let(:menu1){double(:menu1, select: dish1)}
  let(:menu2){double(:menu2, select: dish2)}

  describe '#add_to_basket' do
    it 'calls the menu#select method' do
      expect(menu1).to receive(:select)
      subject.add_to_basket(menu1, 1, 2)
    end

    it 'given the menu, dish number and quantity adds the dish/dishes to the order' do
      subject.add_to_basket(menu1, 1, 2)
      expect( subject.basket.count(dish1) ).to eq 2
    end
  end

  describe '#summary' do
    it 'gives a summary of the order, grouping items and displaying prices with a total' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      expected_output = "2x Dishy1 | £2.22\n3x Dishy2 | £6.66\nTotal cost: £8.88\n"
      expect{ subject.summary }.to output(expected_output).to_stdout
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ subject.summary }.to raise_error "Basket empty"
    end
  end

  describe '#submit' do
    it 'calls the #send_text method if payment matches total' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      expect(subject).to receive(:send_text)
      subject.submit(8.88)
    end

    it 'raises an error if payment does not match the total cost' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      expect{ subject.submit(9.50) }.to raise_error "Payment does not match total cost"
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ subject.submit(0) }.to raise_error "Basket empty"
    end
  end

end
