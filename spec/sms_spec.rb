require "sms"

describe SMS do
  let(:text) { "Well done!" }
  let(:number_to) { "+447751703401" }

  describe 'initialization' do
    it 'should load the ENV variables' do
      expect(Envyable).to receive(:load).with('./config/env.yml', 'dev')
      described_class.new(text, number_to)
    end
  end
end
