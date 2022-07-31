require 'text'
describe Text do

    let(:time) { "11:30" }
    
    xit 'text is not delivered' do
      allow(subject).to receive(:send_text).and_return(false)
      expect(subject.success).to eq false
    end

end