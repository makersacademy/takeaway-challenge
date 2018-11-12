require './lib/menu'
require './lib/takeaway'

describe Takeaway do
  subject(:takeaway) {Takeaway.new}

  it 'will allow a customer to order items' do
    expect(takeaway).to respond_to(:order_items)
  end

  it 'will store an order' do
    expect(@item).to eq(nil)
  end

  context('after a customer has placed an order')
  it 'will print an order' do
    expect { takeaway.order_items }.to output(@item).to_stdout
  end

  it 'will add an item to the order total' do
    expect(@total).to eq(nil)
  end

  context('it can calculate the order total')
  it 'will print the order total' do
    expect { takeaway.order_total }.to output("\"Your order total is 0 pounds\"\n") .to_stdout
  end
end
