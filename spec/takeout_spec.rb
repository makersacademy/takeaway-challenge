require 'takeout'


describe Takeout do

subject(:takeout) { described_class.new }
# let(:dish) {double :dish}

describe '#order' do
  it 'stores the customer orders' do
    takeout.order(1)
    expect(takeout.my_order.dishes). to eq [takeout.menu.dishes[1]]
  end
end

describe '#total' do
  it 'returns the order total' do
    takeout.order(1)
    expect(takeout.total).to eq 1.50
  end
end

describe '#list_of_dishes' do
  it 'returns a list of dishes ordered' do
    takeout.order(1)
    expect(takeout.list_of_dishes).to eq [takeout.menu.dishes[1]]
  end
end

describe '#pay' do
  it 'raises a error if the payment does not equal the order total' do
    takeout.order(1)
    expect {takeout.pay(0.5)}.to raise_error 'Wrong amount.'
  end
end


end
