require 'order'

describe Order do
  let(:order) { [['fish', 5, 1], ['burger', 5, 2]] }
  let(:fake_text) { double :sms, :send_text => "sent" }

  it 'checks total of order' do
    expect(subject.check_total(order)).to eq 15
  end

  it 'sends a text' do
    expect(subject.send_text(fake_text)).to eq "sent"
  end
end
