require 'menu'

describe Menu do

  context "#print_menu" do
    it 'will print a list of menu items' do
      hash = {"chicken" => 3.50, "burrito" => 4.0, "fish" => 5.0}
      expect(subject.print_menu).to eq hash
    end
  end

  context "#price_checker" do
    it 'will check the price of food' do
      expect(subject.price_checker("chicken")).to eq 3.50
    end
  end

  context "#included?" do
    it 'will check if food is on the menu' do
      expect(subject.price_checker("fish")).to eq 5.0
    end
  end

end
