require 'order'

describe Order do

  it 'shows the takeaway\'s menu' do
    expect(subject.takeaway.menu).not_to be_empty
  end

  it 'allows the customer to select a number of the same menu item' do
    expect(subject.choose(2, 2)).to eq 'You have ordered Barbecue Spare Ribs * 2 at £4.50 each.'
  end

  before(:each) do
    subject.choose(1, 2)
    subject.choose(3, 1)
  end

  it 'gives a summary of the order' do
    expect(subject.order_summary).to eq 'You have ordered Chicken Chow Mein * 2 and Special Fried Rice * 1.
    Your total order price is £17.50.'
  end

  it 'checks that the payment amount is correct' do
    expect{ subject.confirm_order(16) }.to raise_error "insufficient payment"
  end

end
