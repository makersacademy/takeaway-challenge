require 'shop'

describe Shop do
  let(:order) { double(:order) }
  let(:user) { double(:user) }
  before(:each) { allow(user).to receive(:tel) { '+7777000000' } }
  before(:each) { allow(subject).to receive(:send).with(any_args) { 'sent' } }
  it 'can take an order' do
    subject.take_order(order, user)
    expect(subject.orders).not_to be_empty
  end
  it 'can increment the order number by 1' do
    subject.take_order(order, user)
    expect(subject.orders[1]).not_to be_nil
  end
  it 'knows how many orders it has' do
    subject.take_order(order, user)
    expect(subject.total_orders).to eq 1
  end
  it 'can send a text message on taking an order' do
    expect(subject.take_order(order, user)).to eq 'sent'
  end

end
