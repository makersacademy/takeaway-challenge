require 'takeaway'

describe Takeaway do
  describe '#menu' do
    it 'show the menu' do
      expect(subject.menu).to eq({
        spring_rolls: 4.55,
        grilled_dumpling: 4.9,
        chicken_fried_rice: 6.95,
        won_tom: 7.95,
        curry_breef_brisket: 7.95,
        coke: 1.2,
        ice_tea: 2.55
      })
    end
  end
end
