require './lib/takeaway.rb'
require 'twilio-ruby'

describe Takeaway do
  it 'has a menu' do
    expect(subject.menu).to eq({ "burger" => 2, "chips" => 1, "kebab" => 3 })
  end
  it 'order errors if total is incorrect' do
    expect { subject.order("burger", 3, 4) }.to raise_error("You have entered the wrong total")
  end
  it 'sends an sms if order is correct' do
    expect(subject.order("burger", 3, 6)).to eq("sms sent")
  end
end
