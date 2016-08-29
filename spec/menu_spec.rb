require 'menu'

describe Menu do

subject(:menu) { described_class.new }


  describe '#print_menu' do
    it "it prints a list of meals with prices" do
      expect(menu.print_menu).to respond_to :map
    end
  end

  describe '#has_meal?' do
    it 'checks whether a meal exits on meals_list' do
      expect(menu.has_meal?("nachos")).to eq true
    end
  end



end
