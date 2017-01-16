describe Text do
  let(:takeaway) {double :takeaway}
  let(:twil_num) {double :twil_num}
  let(:phone_num) {double :phone_num}
  
  describe '#send_message' do
    it 'should send a confirmation text' do
      allow(takeaway).to receive(:send_message).and_return true
      expect(takeaway.send_message(twil_num, phone_num)).to eq true
    end
  end
end
