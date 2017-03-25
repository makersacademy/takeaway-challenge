require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'mains' do
    it 'should initialize with a list of main dishes' do
      expect(menu.mains).to include( {1 => "Lasagna", "price:" => "£10"} )
    end

    it "let's you add item to list of main dishes" do
      menu.add_main("Salad", "7")
      expect(menu.mains).to include( {menu.mains.length => "Salad", "price:" => "£7"} )
    end
  end

  describe 'desserts' do
    it 'should initialize with a list of desserts' do
      expect(menu.desserts).to include( {1 => "Icecream", "price:" => "£5"} )
    end

    it 'let\'s you add item to list of desserts' do
      menu.add_dessert("Waffles", "8")
      expect(menu.desserts).to include( {menu.desserts.length => "Waffles", "price:" => "£8"} )
    end
  end
end
