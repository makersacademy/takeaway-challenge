# frozen_string_literal: true

require './lib/takeaway'
require './lib/sms_sender'
require './lib/menu'
require './lib/order'
require './spec/test_helpers'

describe 'Acceptance Tests' do
  include_examples 'Test Helpers'

  subject do
    Takeaway.new(menu_hash: menu_hash,
                 sms_class: SMSSender,
                 menu_class: Menu,
                 order_class: Order)
  end

  it 'should show a list of dishes with prices' do
    expect(subject.menu.menu_items_string).to eq "Cafe Latte - 4.75\n"\
                                                 "Cappuccino - 3.85"
  end

  it 'should allow selection of some number of several available dishes' do
    Timecop.freeze(time)
    expect(subject.order([1]).to_string).to eq "Cappuccino - 3.85\n"\
                                               "Total: 3.85\n"\
                                               "Delivers by: 11:10"
    Timecop.return
  end

  it 'should calculate the correct order total' do
    expect(subject.order([0, 1]).total).to eq '8.60'
  end

  xit 'should send an sms order confirmation' do
    # WARNING - this is a manual, live test against the real Twilio API
    order = subject.order([1])
    order.contact_number = ENV['MY_NUMBER']
    subject.send_confirmation(order: order)
  end
end