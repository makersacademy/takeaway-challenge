require './lib/menu.rb'

describe Menu do
  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:dishes) }

  describe '#on_menu?' do
    it 'should return true when item is present' do
      expect(subject.on_menu?("Pizza")).to eq(true)
    end

    it 'should return false when item is not present' do
      expect(subject.on_menu?("Beans")).to eq(false)
    end
  end
end
