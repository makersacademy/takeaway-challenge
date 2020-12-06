require 'text'

describe Text do
  let(:text) { described_class.new }

  describe '#new'  do
    it 'should be instance' do
      expect(text).to be_instance_of described_class
    end
  end
end
