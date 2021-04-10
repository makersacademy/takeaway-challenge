require 'takeaway'

describe Takeaway do

  describe '#userstory1' do
    it 'lists the dishes and their prices' do
      expect(subject.menu).to have_key(:Biltong)
      expect(subject.menu).to have_value(5)
    end
  end
end
