require 'takeaway'

describe Takeaway do

  describe '#menu' do


    it {is_expected.to respond_to(:menu)}

    it 'shows a list of dishes with prices' do
      expect(subject.menu).to be_a(Hash)
    end

  end

end
