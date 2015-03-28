require 'capybara/rspec'
require 'order'

feature 'customer makes an order' do
  let(:order) { Order.new(Menu.new.menu) }
  scenario 'selecting items' do
    order.add(flame_grilled_pheonix: 2)
    expect(order.list).to eq flame_grilled_pheonix: 2
  end

  scenario 'check order total cost' do
    order.add(flame_grilled_pheonix: 2)
    expect(order.total).to eq "24.00"
  end

  let(:client) { double :client }
  scenario 'places order, text is sent' do
    order.add(flame_grilled_pheonix: 2)
    allow(Twilio::REST::Client).to receive(:new).and_return(client)
    allow(client).to receive_message_chain(
      'account.messages.create') { :sent }
    sms = SendSMS.new
    allow(Time).to receive(:now) { Time.new(2015, 03, 28, 17, 30, 11) }
    expect(sms.send(order.place(order.total))
    ).to eq 'Thanks for your order, it should arrive before 18:30.'
  end
end
