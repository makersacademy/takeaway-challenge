require './docs/menu.rb'

describe Menu do

let(:menu) { described_class.new }

  describe "#initialize" do
    it 'starts with list of dishes' do
      expect(menu.dishes).not_to be_empty
    end
  end

  describe '#display_menu' do
    it 'should display formatted menu' do
      expect(menu.display_menu).to include ("chilli chicken ramen")
    end
  end

end