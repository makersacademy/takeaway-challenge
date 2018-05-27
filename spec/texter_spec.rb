require 'texter'
describe Texter do
  let(:subject) { Texter.new("This is a test text") }
  describe '#sendtext' do
    it 'sends a text' do
      expect(subject.sendtext).to eq true
    end
  end
end
