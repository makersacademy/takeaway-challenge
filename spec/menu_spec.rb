require 'Menu.rb'

describe Menu do
  describe '#meal_options'
    it 'returns menu' do
      expect(subject.meal_options).to eq([
        {"Hamburger"=>5},
        {"Pizza"=>6},
        {"Pasta"=>4},
        {"Fish and chips"=>5},
        {"Salad"=>3},
        {"Lamb shank"=>7}])
      end

  describe '#select' do
    it 'check method stores selection to #dishes variable' do
      subject.select("Hamburger"=>3, "Pizza"=>2, "Salad"=>5)
        expect(subject.dishes).to eq("Hamburger"=>3, "Pizza"=>2, "Salad"=>5)
    end
  end

end
