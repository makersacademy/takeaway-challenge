require 'takeaway'


describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:add_item) {double (:add_item)}

  describe 'initialize' do
    it 'loads the menu' do
      expect(Menu).to receive (:new)
      subject
    end
  end

  describe '#show menu' do
    it 'displays the menu' do
      allow(subject.menu).to receive(:list).and_return(:menu)
      expect{subject.show_menu}.to output("menu\n").to_stdout
    end
  end

  describe '#add_to_basket' do

    context 'item exists on menu'do

      it 'adds food to the basket' do
        allow(subject).to receive(:check_item).and_return(true)
        allow(subject.menu).to receive(:list).and_return({item: :cost})
        expect(subject.basket).to receive(:add_item).with(:item, :cost, :qty )
        subject.add_to_basket(:item, :qty)
      end

      it 'confirms items were added to the basket' do
        allow(subject.menu).to receive(:list).and_return({item: :cost})
        allow(subject.basket).to receive(:add_item).with(:item, :cost, :qty )
        expect{subject.add_to_basket(:item, :qty)}.to output("#{:qty} #{:item} added to your order\n").to_stdout
      end
    end

    context 'item does not exist on the menu' do

      it 'will not allow item to be added to basket' do
        allow(subject).to receive(:check_item).and_return(false)
        expect{subject.add_to_basket(:item, :qty)}.to raise_error "Item not on menu"
      end
    end
  end

  describe '#check_item' do

    context 'item exists on the menu' do

      it 'will return true if item exists on the menu' do
        allow(subject.menu.list).to receive(:has_key?).and_return(true)
        expect(subject.check_item(:item)).to eq(true)
      end
    end

    context 'item does not exist on the menu' do

      it 'will return true if item exists on the menu' do
        allow(subject.menu.list).to receive(:has_key?).and_return(false)
        expect(subject.check_item(:item)).to eq(false)
      end
    end
  end

  describe '#total' do

    it 'displays to total value of the current order' do
      allow(subject.basket).to receive(:sum)
      allow(subject.basket.sum).to receive(:round).and_return(:value)
      expect{subject.total}.to output("Your total order cost is £#{:value}\n").to_stdout
    end
  end
end
