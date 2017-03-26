require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  # let(:mains)

  describe 'mains' do
    it 'has a list of main dishes' do
      expect(menu.mains).to eq(mains)
    end

    it "let's you add item to list of main dishes" do
      menu.add_main("Salad", "7")
      expect(menu.mains).to include( {name: "Salad", price: "£7"} )
    end
  end

  describe '#show_menu' do
    it 'shows mains' do
      expect(menu.show_mains).to include ( {name: "Lasagna", price: "£10"} )
    end
    it 'shows desserts' do
      expect(menu.show_desserts).to include ( {name: "Icecream", price: "£5"} )
    end
  end

  describe 'desserts' do
    it 'should initialize with a list of desserts' do
      expect(menu.desserts).to include( {name: "Icecream", price: "£5"} )
    end

    it 'let\'s you add item to list of desserts' do
      menu.add_dessert("Waffles", "8")
      expect(menu.desserts).to include( {name: "Waffles", price: "£8"} )
    end
  end
end
