require 'order'

describe Order do

  it 'returns a list of menu items when requested' do
    expect(subject.request_menu).to include :pasta_pillows
  end

  it 'can track items added to an order' do
    subject.add(:fluffy_ruffs)
    expect(subject.ordered_items).to include :fluffy_ruffs
  end

  it 'can track the running total of an order' do
    subject.add(:fluffy_ruffs)
    expect(subject.total_price).to include 8
  end

  it 'should calculate the total cost of the order' do
    subject.add(:fluffy_ruffs)
    subject.add(:pints_o_cream)
    expect(subject.total_order).to eq 14
  end

  it 'should text the user after placing an order' do

  end

end