require 'restaurant'

describe Restaurant do
  dishes = { "Sushi": 7.50, "Burger": 6.10, "Fries": 3.00, "Noodle Soup": 10.00, "Bahn Mi": 9.25 }

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).to_not be_nil
    end
  end

  describe '#select_dishes' do
    it 'lets the user select dishes' do
      expect(subject.select_dishes(1, 3, 4)).to eq { "Sushi": 7.50, "Fries": 3.00, "Noodle Soup": 10.00 }
    end
  end
end