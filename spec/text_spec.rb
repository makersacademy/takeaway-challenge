require 'text'

describe Text do 
  context '#send_text' do 
    it 'sends a message confirming order' do 
      expect(subject).to respond_to(:send_text)
    end
  end
  context '#delivery_time' do 
    it 'is in the hours of the day' do 
      expect(subject.delivery_time.to_i).to be_between(0, 24)
    end
  end
end
