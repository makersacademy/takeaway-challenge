require 'takeaway'

describe Takeaway do

  describe '#display_menu' do
    it 'must be able to display a list of dishes with prices' do
      expect(subject.display_menu).to eq subject.menu
    end
  end

end
