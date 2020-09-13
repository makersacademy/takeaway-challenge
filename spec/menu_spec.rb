require 'menu'

describe Menu do

  it "has dishes when created" do
    expect(subject.dishes).to eq Menu::MENU
  end

  describe '#view' do
    it "shows the menu in a clean format" do
      format_menu = "Pici cacio & pepe - £6, Burrata - £5, Salmon crudo - £10"
      expect(subject.view).to eq (format_menu)
    end
  end

  describe '#on_menu?' do
    it 'checks if a dish is on the menu' do
      dish = "Burrata"
      expect(subject.on_menu?(dish)).to eq true
    end

    it 'checks if a dish is on the menu' do
      dish = "Cabbage"
      expect(subject.on_menu?(dish)).to eq false
    end
  end

  describe '#cost' do
   it 'returns the price of the dish' do
    dish = "Burrata"
    expect(subject.cost(dish)).to eq 5
   end
  end

end
