require 'order_total'

describe OrderTotal do

  subject(:order_total) { described_class.new }

  it 'should be intialized with a variable, total cost, which should equal 0' do
    expect(order_total.total_cost).to eq 0
  end

  it 'should be able to calculate total cost of order' do
    order =  [{{"1. Steak and Liver API" => 4} => 1,
    {"3. Steak and Onion API" => 6} => 1}]
    expect(order_total.cost(order)).to eq 10
  end

  it 'should be able to calculate total cost of order' do
    order =  [{{"1. Steak and Liver API" => 4} => 1,
    {"4. GUI Chocolate Pudding" => 5} => 1}]
    expect(order_total.cost(order)).to eq 9
  end


end
