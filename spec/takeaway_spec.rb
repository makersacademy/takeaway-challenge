require './lib/takeaway.rb'
require 'twilio-ruby'

describe Takeaway do
  it 'has a menu' do
    expect(subject.menu).to eq({ "burger" => 2, "chips" => 1, "kebab" => 3 })
  end
  # it 'order errors if total is incorrect' do
  #   expect { subject.order("burger", 3, 4) }.to raise_error("You have entered the wrong total")
  # end
  it 'sends an sms if total order is correct' do
    takeaway = Takeaway.new
    allow(takeaway).to receive(:send_sms).and_return("sms sent")
    expect(takeaway.order("burger", 3)).to eq("sms sent")
  end
  it 'can calculate the total of the order' do
    subject.order("burger", 3)
    subject.order("chips")
    expect(subject.current_total).to eq 7
  end
  # it 'shows order so far' do
  #   subject.order("burger", 3)
  #   subject.order("chips")
  #   expect(subject.see_order).to eq "burger x3 = £6, chips x1 = £1"
  # end
end
