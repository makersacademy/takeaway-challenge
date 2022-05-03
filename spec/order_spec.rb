require './docs/order'

describe Order do
  let(:menu) { Menu.create }
  let(:order) { Order.create }

  it 'is an instance of Order class' do
    expect(subject).to be_an_instance_of Order
  end

  it 'responds to add_to_basket' do
    expect(subject).to respond_to :add_to_basket
  end

  describe '#add_to_order' do
    context 'item is on the menu' do
      it 'can add dishes to current order' do
        subject.add_to_basket("Guinness", 1)
        expect(subject.current_order).to eq(["Guinness"])
      end

      it 'can add multiple dishes at once' do
        subject.add_to_basket("Guinness", 4)
        expect(subject.current_order).to eq(["Guinness", "Guinness", "Guinness", "Guinness"])
      end
    end

    context 'item is not on the menu' do
      it 'returns "Item not on the menu"' do
        expect { subject.add_to_basket("Chips", 1) }.to raise_error ("Item not on the menu")
      end
    end
  end

  describe '#calculate_price' do
    it 'adds up the current order price' do
      menu = Menu.new
      subject.add_to_basket("Guinness", 2)
      subject.add_to_basket("Huel", 1)
      expect(subject.calculate_price).to eq(15)
    end
  end

  describe '#complete_order' do
    it 'completes the order' do
      text = SMS.new
      text.send_sms("my number")
      expect(text).to respond_to(:complete_order)
    end
  end
end
