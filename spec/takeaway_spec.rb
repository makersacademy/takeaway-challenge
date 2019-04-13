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

  describe '#take_order' do
    it 'take order from customer input' do
      subject.take_order({
      spring_rolls: 2,
      won_tom: 1,
      ice_tea: 3
      })

      expect(subject.order). to eq(
        {
        spring_rolls: 2,
        won_tom: 1,
        ice_tea: 3
        }
      )
    end

    it 'validate whether the dish is available' do
      expect { subject.take_order(
        { spring_rolls: 2,
          won_tom: 1,
          beer: 2,
          }) }.to raise_error(RuntimeError) { "bear is not available" }
    end

    it 'validate whether the dishes are available' do
      expect { subject.take_order({
        spring_rolls: 2,
        beef_steak: 1,
        beer: 2,
        }) }.to raise_error(RuntimeError) { "beef_steak and bear are not available" }
    end

  end

  describe '#order_match?' do
    let(:subject) {
      subject = described_class.new
      subject.take_order({
      spring_rolls: 2,
      won_tom: 1,
      ice_tea: 3
      })
      subject
    }

    it " return true when given number match the sum of ordered dishes" do
      expect(subject.order_match?(6)).to eq true
    end

    it " return false when given number not match the sum of ordered dishes" do
      expect(subject.order_match?(4)).to eq false
    end
  end

end
