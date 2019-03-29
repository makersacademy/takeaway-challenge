require 'order'

describe Order do
  let(:order) { [{ dish: 'fish', price: 5 }] }
  let(:FakeSMS) { double :FakeSMS, :messages => self, :create => true }

  it 'checks total of order' do
    expect(subject.check_total(order)).to eq 5
  end

  it 'sends a text' do
    expect(subject.send_text(SMSClient.new)).to eq 'hello'
  end
end

# RSpec.configure. do |config|
  # config.before(:each) do
  #  stub_const("Twilio::REST::Client", FakeSMS)
  # end
# end
