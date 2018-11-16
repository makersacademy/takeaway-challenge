require './lib/menu'
require './lib/takeaway'


describe Menu do
  subject(:Menu) {Menu.new}
  it 'will list menu items' do
    expect(:menu.list_items).to eq({
      :burger => 5,
      :pizza => 10,
      :fries => 2,
      :salad => 3
    })
  end
end

describe Takeaway do
  subject(:takeaway) {Takeaway.new(menu)}
  let(:menu) {double :menu}

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
    expect { takeaway.order_total }.to output("\"Your order total is £0\"\n") .to_stdout
  end

  it 'will take orders via user input' do
    allow(takeaway).to receive(:gets).and_return("pizza", "end")
    takeaway.order_items
    expect(takeaway.order_total).to eq "Your order total is £10"
  end

  it 'will let a user see menu items' do
    expect(menu).to receive(:list_items)
    takeaway.list_items
  end
end
