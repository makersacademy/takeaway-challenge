require 'menu'

describe Menu do

  describe '#data' do
    let(:item) { double :item }
    let(:items) { [item, item, item] }
    subject { described_class.new(items) }

    it "returns the list of items' duplicate" do
      expect(subject.data).to eq items.dup
    end
  end
end
