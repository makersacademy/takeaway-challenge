require 'order'

describe Order do
  it {is_expected.to respond_to(:order)}

  describe '#read_menu' do
    it 'should return the menu' do
      expect(subject).to respond_to(:read_menu)
    end
  end

  describe '#add' do
    it 'should let an item from the menu be placed on the order' do
      subject.add 'pizza', 2
      expect(subject.order).to eq({'pizza' => 2})
    end

    it 'should give a confirmation that the item has been added to the order' do
      confirmation_text = "2x pizza has been added to your order."
      expect(subject.add 'pizza', 2).to eq confirmation_text
    end

    it 'should not allow items not on the menu to be added to the order' do
      expect{subject.add('sushi', 2)}.to raise_error('That dish is not on our menu. Please only choose items on the menu.')
    end
  end




  describe '#price_total' do
    it 'should calculate the total price of the items put on the order' do
      subject.add 'pizza', 2
      subject.add 'pint', 2
      expect(subject.total_price).to eq "Total Order Price: £23.96"
    end
  end

  describe '#order_total' do
    it 'should display the items listed on the order' do
      subject.add 'pizza', 2
      subject.add 'pint', 2
      expect(subject.order_total).to eq("pizza(s) x2 = £15.98, pint(s) x2 = £7.98")
    end

    it 'should raise an error if the order is left empty' do
      expect{subject.order_total}.to raise_error('You haven\'t chosen anything from the menu yet.')
    end
  end

end
