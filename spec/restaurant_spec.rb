require 'restaurant'

describe Restaurant do
  dishes = [
    {dish: "Sushi", price: 7.50}, 
    {dish: "Burger", price: 6.10}, 
    {dish: "Fries", price: 3.00}, 
    {dish: "Noodle Soup", price: 10.00}, 
    {dish: "Bahn Mi", price: 9.25}
  ]

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).to_not be_nil
    end
  end

  describe '#select_dishes' do
    it 'lets the user select dishes' do
      expect(subject.select_dishes(1, 3, 4)).to eq [{dish: "Sushi", price: 7.50}, {dish: "Fries", price: 3.00}, {dish: "Noodle Soup", price: 10.00}]
    end
  end
end