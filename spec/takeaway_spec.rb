require 'order'
require 'menu'
require 'pricecalculation'

describe Order do
  let(:subject) { Order.new }
  let(:checkout) { double :checkout }

  it 'shows menu including list of dishes and prices' do

    expect(subject.read_menu).to eq subject.read_menu
  end

  it 'should allow you to select menu items and add them to order' do
    dish = 'Beef Burger'
    quantity = 5
    expect { subject.select(dish, quantity) }.to output("#{quantity} X #{dish}(s) added to order\n").to_stdout
  end

  it 'defaults quanitiy of item to 1 if quanitity not given' do
    subject.select('Beef Burger')
    subject.order_summary
    expect(subject.summary).to eq "Beef Burger X 1 = £6.99"
  end

  it 'should add multiple items to the order' do
    # new_order = Order.new
    subject.select("Beef Burger", 10)
    subject.select("Veggie Burger", 13)
    subject.order_summary
    expect(subject.summary).to eq "Beef Burger X 10 = £69.9, Veggie Burger X 13 = £64.87"
  end

  it 'should return total cost of order item by item' do
    # new_order = Order.new
    subject.select("Beef Burger", 5)
    subject.select("Veggie Burger", 3)
    expect(subject.order_summary).to eq "Beef Burger X 5 = £34.95, Veggie Burger X 3 = £14.97"
  end

  it 'should return total order price on request' do
    subject.select('Beef Burger', 3)
    subject.select('Chicken Burger', 2)
    subject.order_summary
    expect(subject.total_cost).to eq "Total: £32.95"
  end

  it 'should return the total order cost' do
    subject.select("Beef Burger", 10)
    subject.select("Veggie Burger", 13)
    subject.order_summary
    expect(subject.total_price).to eq 134.77
  end

  it "sends sms messages" do
    subject.select('Beef Burger', 3)
    subject.order_summary
    expect(subject).to receive(:checkout)
    subject.checkout
  end
end
