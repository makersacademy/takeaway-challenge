require 'message'

describe Message do
let(:client) { double :client }
  it 'can send confirmation text via Twilio' do #is there a better way to test message.rb?? not sure about this spec file and test
    expect(subject).to respond_to(:send).with(1).argument
  end

  it 'can send text' do
    time = Time.now
    allow(Time).to receive(:now).and_return(time)
    twilio_id = ENV['TWILIO_ID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_body = { 
      from: ENV['TWILIO_NUM'], 
      to: ENV['MY_NUM'], 
      body: "Thank you for your order, which totals to £12.00. Your food will arrive by #{(time+60*60).strftime("%H:%M")}" 
      }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_body)
    expect(Twilio::REST::Client).to receive(:new).and_return(client)
    subject.send(12.00)
  end

  it 'confirms order total and arrival time via text' do
    time = Time.now
    allow(Time).to receive(:now).and_return(time)
    expect(subject.send(12.00)).to eq "Thank you for your order, which totals to £12.00. Your food will arrive by #{(time+60*60).strftime("%H:%M")}"
  end
end

