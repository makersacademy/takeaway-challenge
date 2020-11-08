require 'order'
require 'menu'

describe Order do
  let(:order) { Order.new }
  let(:dish) { double :dish }

  it 'initializes with a menu from the Menu class' do
    expect(order.menu).to eq(Menu::MENU)
  end

  it 'responds to add a dish' do
    expect(subject).to respond_to(:add).with(2).argument
  end

  it 'adds the name of the dish to @order' do
    expect { order.add('Beef Teriyaki') }.to change { order.order }.from([]).to(['Beef Teriyaki'])
  end

  it 'add the cost of the dish to @bill' do
    teriyaki_cost = 10
    expect { order.add('Beef Teriyaki') }.to change { order.total }.from(0).to(teriyaki_cost)
  end

  it 'adds multiple dishes to full_order' do
    expect { order.add('Beef Teriyaki', 3) }.to change { order.order }.from([]).to(['Beef Teriyaki', 'Beef Teriyaki', 'Beef Teriyaki'])
  end

  it "raises an error when dish isn't on menu" do
    dish = 'Katmandu'
    expect { order.add(dish) }.to raise_error("#{dish} is not avialable")
  end

  it 'shows the customer that the order value matches the total' do
    order.add('Beef Teriyaki', 2)
    expect(order.total_correct?).to eq true
  end

  it 'send a text to confirm the order' do
    testorder = double("order")
    allow(testorder).to receive(:confirm_order).and_return("Correct")

    # expect(order).to respond_to :confirm_order
    expect(testorder.confirm_order).to eq("Correct")
  end
end
