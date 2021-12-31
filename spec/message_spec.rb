require 'message'

describe Message do
 
  it 'can send confirmation text via Twilio' do #is there a better way to test message.rb?? not sure about this spec file and test
    expect(subject).to respond_to(:send).with(1).argument
  end

  it 'confirms order total and arrival time via text' do
    time = Time.now
    allow(Time).to receive(:now).and_return(time)
    expect(subject.send(12.00)).to eq "Thank you for your order, which totals to £12.00. Your food will arrive by #{(time+60*60).strftime("%H:%M")}"
  end
end