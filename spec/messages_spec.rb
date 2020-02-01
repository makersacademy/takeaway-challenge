require 'messages'
describe Messages do
  describe '#send' do
  before do
    allow(subject).to receive(:send)
  end
    it 'sends a text with the body' do
    expect(subject).to receive(:send).with("something")
    subject.send("something")
    end
  end
end