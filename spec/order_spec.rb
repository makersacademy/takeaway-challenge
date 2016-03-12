require 'order'

describe Order do

  it 'shows the takeaway\'s menu' do
    expect(subject.takeaway.menu).not_to be_empty
  end

  describe '#choose' do
    it 'allows the customer to select a number of the same menu item' do
      expect(subject.choose(2, 2)).to eq 'You have ordered Barbecue Spare Ribs * 2 at £4.50 each.'
    end

  end

  it 'gives a total price for all items ordered' do
    subject.choose(2, 2)
    subject.choose(4, 3)
    subject.choose(5, 1)
    expect(subject.order_total).to eq 27
  end

end
