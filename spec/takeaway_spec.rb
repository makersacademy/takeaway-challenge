require './lib/takeaway.rb'

describe Takeaway do

  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:menu) }

  it { is_expected.to respond_to(:add).with(1).arguments }

  describe '#menu' do

    it 'should be hash type' do
      expect(subject.menu).to be_instance_of(Hash)
    end

  end

end
