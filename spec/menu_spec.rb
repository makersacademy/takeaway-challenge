require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#item_list' do
    it 'should be a hash' do
      expect(subject.item_list).to be_an_instance_of(Hash)
      end
  end

  it "has a list of items" do

  end
end
