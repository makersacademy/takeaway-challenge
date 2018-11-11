require 'menu'

describe Menu do

  it { is_expected.to respond_to(:view).with(0).argument }

  describe '#view' do

    it 'should return a list of items & prices' do
      expect(subject.view).to eq subject.list
    end

  end

end
