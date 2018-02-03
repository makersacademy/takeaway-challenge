require 'menu'

describe Menu do

  describe "#menu output" do
    default_menu = {
      'Nutella on rice cakes and banana on top' => 3,
      'Scrumbled eggs' => 4.99,
      'Roasted aubergine & tomato curry' => 5.60,
      'Jacket Potato with whipped feta' => 8.25,
      'Mushroom, ricotta & rocket tart' => 9.20,
      'Cod with beans & artichokes' => 11.40,
    }

    it { is_expected.to respond_to :list }

    it 'should output a list with dishes and prices' do
      expect(subject.list).to eq default_menu
    end
  end
end
