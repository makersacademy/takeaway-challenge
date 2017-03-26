require 'takeout'


describe Takeout do

subject(:takeout) { described_class.new }

describe '#order' do
  it 'stores the customer orders' do
    takeout.order(1)
    expect(takeout.my_order[-1].name).to eq 'Cold chicken'
  end
end

describe '#total' do
  it 'calaculates the order total' do
    takeout.order(1)
    expect(takeout.order.total).to eq 1.50
  end
end

describe '#pay' do
  it 'raises a error if the payment does not equal the order total' do
    takeout.order(1)
    expect {takeout.pay(0.5)}.to raise_error 'Wrong amount.'
  end
end



end
