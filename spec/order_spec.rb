require 'order'

describe Order do

  it 'shows the takeaway\'s menu' do
    expect(subject.takeaway.menu).not_to be_empty
  end

    it 'allows the customer to select a number of the same menu item' do
      expect(subject.choose(2, 2)).to eq 'You have ordered Barbecue Spare Ribs * 2 at £4.50 each.'
    end

  it 'gives a total price for all items ordered' do
    subject.choose(2, 2)
    subject.choose(4, 3)
    subject.choose(5, 1)
    expect(subject.total_price).to eq "The total price of this order is £27.00."
  end

  it 'gives a summary of the order' do
    subject.choose(1, 2)
    subject.choose(3, 1)
    expect(subject.order_summary).to eq 'You have ordered Chicken Chow Mein * 2 and Special Fried Rice * 1.
    Your total order price is £17.50.'
  end

end
