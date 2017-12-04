require 'menu'
require 'order'

describe Order do
  let(:menu) { double(:menu, print_dishes: Array, menu_items: Array,) }
  let(:sms) { TextMessage.new }
  let(:order) { Order.new(menu) }
  let(:test) { double(:order, gets: '1') }

  it 'should initialize with a list of dishes' do
    expect(order.menu).to eq(menu)
  end 

  it 'should print menu for user' do
    expect(order.print_menu).to eq(order.menu.print_dishes)
  end

  it "should assign current order with user input" do
    allow($stdin).to receive(:gets).and_return(0)
    order.take_order
    expect(order.dish_num).to eql([0])

  end

  it "should assign quantity with user input" do
    allow($stdin).to receive(:gets).and_return(0)
    order.take_order
    expect(order.quantity).to eql([0])
  end

  it 'should return current order' do
    allow($stdin).to receive(:gets).and_return(0)
    order.take_order
    expect { order.order_confirmation }.to change { order.current_order.length }.by(0)
  end

  it 'should take order' do
    allow($stdin).to receive(:gets).and_return(0)
    expect(sms).to receive(:send_sms).and_return("Order successful")
    sms.send_sms
  end
end
