require 'notifier'

describe Notifier do

  it 'checks if the class exists' do
    expect(subject).to be_a Notifier
  end

  describe '#send' do 

    before do
      allow(subject).to receive :send_text 
    end 

    it 'checks the method exists' do 
      expect(subject).to respond_to :send_text
    end 

    it 'takes one argument' do
      expect(subject).to respond_to(:send_text).with(1).argument 
    end

    it 'sends a text with a body' do
      expect(subject).to receive(:send_text).with("some sort of text")
      subject.send_text("some sort of text")
    end
  end
end
    
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
