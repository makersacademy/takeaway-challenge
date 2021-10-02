require 'order'

describe Order do

  let(:item) { double :item }
  let(:menu) { double :menu, dishes: [:item1, :item2] }

  describe 'add items to order' do
    it 'throws error if item is not on menu' do
      expect { subject.check_item(:item) }.to raise_error("We are unable to find that item.")
    end
    
    it 'adds item and quantity to order items' do
      subject.order('Peroni')
      expect(subject.items).to include(['Peroni', 1])
    end

    it 'adds price to total' do
      subject.order('Peroni', 5)
      expect(subject.total).to eq 15
    end
  end

  describe 'listing the order' do
    it 'lists the items' do
      subject.order('Peroni', 2)
      subject.order('Veg Arancini', 2)
      expect { subject.list }.to output(
  <<-menu
2x Peroni
2x Veg Arancini
Your total today is £23.0
menu
      ).to_stdout
    end
  end

  it 'sends a payment confirmation text message' do
    subject.order('Peroni', 5)
    expect(subject).to receive(:send_text)
    subject.complete_order
  end
end
