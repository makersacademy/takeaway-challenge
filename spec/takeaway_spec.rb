require 'Takeaway'

describe Takeaway do

  subject(:takeaway1) {described_class.new}

  it 'creates a new Takeaway' do
    expect(described_class.new).to be_a(Takeaway)
  end

  it 'has an order method' do
    expect(subject).to respond_to(:make_order).with(2).arguments
  end

  it 'takes an order in form of a hash' do
    order_hash = {"Chicken Noodle Soup" => 1,"Chicken Tikka Madras" => 1, "Fresh Caesar Salad" => 1,}
    subject.make_order(order_hash,nil)
    expect(subject.your_order).to be_a (Hash)
    end
   end
