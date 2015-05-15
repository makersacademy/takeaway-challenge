require_relative '../lib/customer'
require 'menu_spec'

describe Customer do
  time = Time.new

  let(:menu) { double :menu, display_menu: [["Pounded Yam", 15], ["Jollof Rice", 10]] }
  let(:twilio) { double :twilio, send_message: "Thank you. Your order has been placed and will be delivered before #{(time.hour + 1)}:#{time.min}" }

  it 'should be able to select a dish from the menu' do
    expect(subject.select_dish menu, 1).to eq(["Pounded Yam", 15])
  end

  it 'should be able to verify correct order' do
    subject.select_dish menu, 1
    subject.select_dish menu, 2
    expect(subject.order_total).to eq 25
  end

  it 'should be able to send a text verifying correct order has been placed' do
    time = Time.new
    expect(subject.confirm_order twilio).to eq("Thank you. Your order has been placed and will be delivered before #{(time.hour + 1)}:#{time.min}")
  end

end