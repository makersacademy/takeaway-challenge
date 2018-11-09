require 'order.rb'

describe Order do
  it 'checks that a customer can order a curry and order displayed' do
    expect(subject.order_food("curry", 1)).to eq("curry ordered x 1")
  end
  it 'checks that a customer can order 2 curries' do
   expect(subject.order_food("curry", 2)).to eq("curry ordered x 2")
  end
  it 'checks the bill after ordering 2 curries' do
    subject.order_food("curry", 2)
    expect(subject.bill) .to eq(10)
  end
end
