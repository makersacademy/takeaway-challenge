require "sms"

describe SMS do
  let(:text) { "Well done!" }
  let(:number_to) { "+447751703401" }
  subject { described_class.new(text, number_to) }

  describe 'initialization' do
    it 'should load the ENV variables' do
      expect(subject.env_loaded?).to be true
    end
  end
end
