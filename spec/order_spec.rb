require 'order'

describe Order do

  describe '#add_item' do

    it 'responds to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

  end

end
