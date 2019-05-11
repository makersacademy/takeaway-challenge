require 'menu'

describe Menu do

  let(:menu) { Menu.new(dishes) }
  let(:dishes) { { burrito: '£6.80' } }

  describe "#show" do
    it "should show a dish with a price" do
      expect(menu.view).to eq(dishes)
    end
  end
end
