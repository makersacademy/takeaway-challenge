require 'menufactory'
require 'menu'
require 'dish'

describe MenuFactory do

  let(:list) { [{name: :sushi, price: 5},
                {name: :burger, price: 3},
                {name: :noodles, price: 4}]
    }
  context "when provided with the following list" do
    before do
      menu = described_class.build(list)
    end
    it "builds a menu with a list of dish objects" do
      menu = described_class.build(list)
      burger = menu.dishes[1]
      expect(burger.name).to eq :burger
    end
  end
end