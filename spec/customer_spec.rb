require 'customer'

describe Customer do

  let(:takeaway){ Takeaway.new }

  it 'can view the menu' do
    expect(subject.view_menu).to eq(takeaway.menu)
  end

  it { is_expected.to respond_to(:select_item).with(2).arguments }

  it 'cannot select an item that is not on the menu' do
    expect{ subject.select_item('sausage', 1)}.to raise_error
    'Sorry, that item is not on the menu.'
  end

  it 'dish selection should be placed in order basket' do
    subject.select_item('pizza', 1)
    expect(subject.order_basket).to eq('pizza' => 1)
  end

  it { is_expected.to respond_to(:receipt) }

  it 'can check order total' do
    subject.select_item('pizza', 2)
    subject.select_item('burger', 1)
    expect(subject.order_total).to eq(27.00)
  end

  it 'can check takeaway receipt in order to compare to order total' do
    subject.select_item('pizza', 2)
    subject.select_item('burger', 1)
    expect(subject.receipt).to eq('Your order has 3 items with a total of £27.00')
  end

  it { is_expected.to respond_to(:place_order) }




end
