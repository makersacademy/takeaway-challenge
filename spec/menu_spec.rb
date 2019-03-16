require 'menu'

describe Menu do
  describe '#show' do
    it { is_expected.to respond_to(:show)}

    it 'is empty by default' do
      expect(subject.show.length).to eq(0)
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).argument }
  end
end
