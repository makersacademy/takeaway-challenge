require 'dish_list'

describe DishList do

  describe '#all_dishes' do

    it 'returns all available dishes and their prices' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      test_dish2 = Dish.new("Pilau Rice", 1.50)
      subject.all_dishes << test_dish
      subject.all_dishes << test_dish2
      expect(subject.all_dishes).to eq [test_dish, test_dish2]
    end
  end

  describe '#add_dish_to_list' do

    it 'adds a dish to the list of available dishes(Checking name is correct)' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.add_dish_to_list(test_dish)
      expect(subject.all_dishes[-1].name).to eq "Chicken Korma"
    end

    it 'adds a dish to the list of available dishes(Checking price is correct)' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.add_dish_to_list(test_dish)
      expect(subject.all_dishes[-1].price).to eq 6.00
    end

    it 'adds a dish to the list of available dishes(checking dish ID)' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.add_dish_to_list(test_dish)
      expect(subject.all_dishes[-1]).to eq test_dish
    end
  end

  describe '#add_dish_to_basket' do

    it 'adds the dish to the checkout_basket array' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.add_dish_to_basket(test_dish)
      expect(subject.checkout_basket[-1]).to eq test_dish
    end

    it 'adds the price to the total_price' do
      test_dish = Dish.new("Chicken Korma", 6.00)
      subject.add_dish_to_basket(test_dish)
      expect(subject.total_price).to eq 6.00
    end
  end
end
