require 'order'

describe Order do
  let(:subject) { described_class.new }

  describe '#initialize' do
    it 'should contain an empty array' do
      expect(subject.current_order).to eq []
    end
  end
end
