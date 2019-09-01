require './lib/takeaway.rb'
require 'twilio-ruby'

describe Takeaway do
  it 'has a menu' do
    expect(subject.menu).to eq({ "burger" => 2, "chips" => 1, "kebab" => 3 })
  end
  it 'sends an sms if total order is correct' do
    takeaway = Takeaway.new
    allow(takeaway).to receive(:send_sms).and_return("sms sent")
    takeaway.order("burger", 3)
    expect(takeaway.complete_order).to eq("sms sent")
  end
  it 'shows the order so far' do
    takeaway = Takeaway.new
    allow(takeaway).to receive(:send_sms).and_return("sms sent")
    takeaway.order("burger", 3)
    takeaway.order("chips", 3)
    expect(takeaway.order_summary).to eq "burger x3 = £6, chips x3 = £3"
  end
  it 'shows the total of the order' do
    takeaway = Takeaway.new
    allow(takeaway).to receive(:send_sms).and_return("sms sent")
    takeaway.order("burger", 3)
    takeaway.order("chips", 3)
    expect(takeaway.order_total).to eq "Total = £9"
  end
end
