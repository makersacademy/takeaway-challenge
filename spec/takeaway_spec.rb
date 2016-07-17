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
        #allow(subject.check_item).to receive(:list).and_return(true) - commented out, doesn't recieve expected argument??
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

  end

  describe '#total' do
    it 'displays to total value of the current order' do
      expect(subject)
    end
  end

end
