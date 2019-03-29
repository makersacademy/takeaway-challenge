require 'order'

describe Order do
  let(:order) { [{ dish: 'fish', price: 5 }] }
  let(:fake) { double :sms, :send_text => "sent" }

  it 'checks total of order' do
    expect(subject.check_total(order)).to eq 5
  end

  it 'sends a text' do
    expect(subject.send_text(fake)).to eq "sent"
  end
end
