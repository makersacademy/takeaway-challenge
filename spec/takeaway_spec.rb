require 'takeaway'
require 'order'
require 'menu'
require 'twilio-ruby'

describe Takeaway do

  let(:dish) { double :dish }
  let(:order) { double :order, complete: "18:52", delivery_time: "18:52" }

  it 'starts with an empty order' do
    expect(subject.order.dishes).to be_empty
  end

  it 'starts with a default menu' do
    expect(subject.menu.list_dishes).to include(a_kind_of(Dish))
  end

  it 'can add a dish to an order' do
    expect { subject.select_dish(dish) }.to change { subject.order.dishes.length }.by(1)
  end

  it 'can accept an order to complete' do
    subject.order_complete
    expect(subject.order.delivery_time).to be_a_kind_of(String)
  end

  it 'can issue a delivery confirmation text' do
    takeaway = Takeaway.new
    allow(takeaway).to receive(:send_message).and_return("accepted")
    expect(takeaway.order_complete(order)).to eq("Thank you! Your order was placed and will be delivered before 18:52")
  end

end
