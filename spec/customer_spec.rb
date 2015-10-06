require 'customer'

describe Customer do

  let(:takeaway){ Takeaway.new }

  it 'can view the entire menu' do
    expect(subject.view_menu).to eq(takeaway.menu)
  end

  it 'can select available items on menu' do
    subject.select_item('pizza', 1)
    expect(subject.order_basket).to eq('pizza' => 1)
  end

  it 'cannot select an item that is not on the menu' do
    expect{ subject.select_item('sausage', 1)}.to raise_error
    'Sorry, that item is not on the menu.'
  end

  it 'dish selection and quantity should be placed in order basket' do
    subject.select_item('pizza', 1)
    expect(subject.order_basket).to eq('pizza' => 1)
  end

  it 'can check total cost of order' do
    subject.select_item('pizza', 2)
    subject.select_item('burger', 1)
    expect(subject.total_cost).to eq('£27.00')
  end

  it 'can check takeaway receipt' do
    subject.select_item('pizza', 2)
    expect(subject.receipt).to eq('2x pizza - £20.00')
  end

  it 'raises an error when right amount is not paid' do
    subject.select_item('pizza', 2)
    expect{ subject.pay('£15.00') }.to raise_error
      'Payment does not match total, please try payment again'
  end
end
