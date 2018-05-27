require 'confirmation.rb'

describe Confirmation do 
  let(:test) { double :test }

  it 'has the correct sender number' do 
    expect(subject.sender).to eq '+441133205765'
  end

  it 'has the correct receiver' do
    expect(subject.receiver).to eq '+447412525804' 
  end

  it 'sends a text message' do 
    expect(subject).to receive(:send_text_message)
    allow(subject).to receive(:send_text_message).and_return("test")
    subject.send_text_message("this is a test for rspec")
  end
end

# i expect the delivery time to be an hour infront of what the time is now 
# I want to give the current time as a stub so that it doens't change 