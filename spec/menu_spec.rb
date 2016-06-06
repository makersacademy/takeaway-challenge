require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes)  do { 
    dish1: 2.50, 
    dish2: 1.50 
  }
  end

  describe '#printing' do
    it "has a list of dishes with prices" do
      expect(menu.dishes).to eq dishes
    end

    it "prints a list of dishes with prices" do
      print_menu= "dish1: £2.50, dish2: £1.50"
      expect(menu.printing). to eq print_menu
    end
  end
end