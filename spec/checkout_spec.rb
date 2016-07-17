require 'checkout'

describe Checkout do
  let(:subject) { described_class.new }
  let(:texter) { double(:texter, text: nil) }

  before do
    subject.instance_variable_set("@texter", texter)
  end

  describe '#do' do
    it 'tells Texter to text' do
      expect(texter).to receive(:text)
      subject.do
    end
  end
end
