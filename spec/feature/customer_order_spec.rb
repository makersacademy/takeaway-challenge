require 'capybara/rspec'
require 'order'

feature 'customer makes an order' do
  let(:order) { Order.new(Restaurant.new.menu) }
  scenario 'adding items to order' do
    order.add(flame_grilled_pheonix: 2)
    expect(order.list).to eq flame_grilled_pheonix: 2
  end

  scenario 'raises error for non-menu items' do
    expect { order.add(boiled_pheonix: 2) }.to raise_error
  end

  let(:restaurant) { Restaurant.new }
  scenario 'check order total cost' do
    order.add(flame_grilled_pheonix: 2)
    total = restaurant.total(order.list)
    expect(total).to eq "24.00"
  end

  let(:client) { double :client }
  scenario 'places order, text is sent' do
    order.add(flame_grilled_pheonix: 2)
    allow(Twilio::REST::Client).to receive(:new).and_return(client)
    allow(client).to receive_message_chain(
      'account.messages.create') { :sent }
    sms = SendSMS.new
    items = order.list
    total = restaurant.total(items)
    allow(Time).to receive(:now) { Time.new(2015, 03, 28, 17, 30, 11) }
    expect(sms.send(restaurant.place(items, total))
    ).to eq 'Thanks for your order, it should arrive before 18:30.'
  end
end
