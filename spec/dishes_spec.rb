require 'dishes'

describe ListOfDishes do
  describe '#new' do
    it 'makes a hashes of dishes' do
      expect(subject.dishes).not_to be nil
    end
    it 'makes a hashes with the list of names of dishes' do
      expect(subject.dishes).to include("rice")
    end
    it 'makes a hashes with the list of prices of the dishes' do
      expect(subject.dishes).to include("rice" => 1)
    end
  end

  describe '#menu_layout' do
    it 'prints a list of all available dishes and their cost' do
      subject.menu_layout
      expect(subject.all_dishes).not_to be nil
    end
  end

  describe '#print_menu' do
    it 'lets the customer decide to look at the menu' do
      expect(subject.print_menu).to include("The available dishes are: ")
    end
  end
end
