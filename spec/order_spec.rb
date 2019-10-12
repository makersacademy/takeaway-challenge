require 'order'

describe Order do

  let(:item) { :bao }
  let(:menu) { double :menu }
  let(:customer) { double :customer }
  let(:number) { double :number }
  # let(:menu_class) { double 'Menu class', new: menu }
  subject { described_class.new(customer, number) }

  it 'order has a name' do
    expect(subject.customer).to eq(customer)
  end

  it 'order has a number' do
    expect(subject.number).to eq(number)
  end

  it 'starts with an empty order' do
    expect(subject.order).to be_empty
  end

  it 'adds an item to the order' do
    subject.add(item,5)
    expect(subject.order).to include(item)
  end

  it 'updates quantity of an item already in the order' do
    subject.add(item,5)
    subject.add(item,1)
    expect(subject.order[item]).to eq(6)
  end

  it 'gives a total for the order' do
    allow(menu).to receive(:[]).and_return(4)
    subject.add(item,2)
    subject.calc_total(menu)
    expect(subject.total).to eq(8)
  end

end
