require 'text'

describe Text do 
  before do
    allow(subject).to receive(:send_text)
  end
  context '#send_text' do 
    it 'sends a message confirming order' do 
      expect(subject).to respond_to(:send_text)
    end
  end
end
