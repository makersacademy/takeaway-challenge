require "./lib/takeaway.rb"

describe Takeaway do

  prices = {
    "Curry Goat w/ Rice & Peas" => 7.99,
    "Oxtail Stew w/ White Rice" => 8.49,
    "Barrel Grilled Whole Jerk Chicken" => 12.99,
    "Trinidad Special Roast Snapper" => 7.59,
    "Traditional Lamb Patty" => 3.99,
    "Salted Cassava Chips" => 2.99,
    "Mango, Banana, Lime & Rum Drink" => 4.59
    }

  menu = {
    1 => "Curry Goat w/ Rice & Peas",
    2 => "Oxtail Stew w/ White Rice",
    3 => "Barrel Grilled Whole Jerk Chicken",
    4 => "Trinidad Special Roast Snapper",
    5 => "Traditional Lamb Patty",
    6 => "Salted Cassava Chips",
    7 => "Mango, Banana, Lime & Rum Drink"
}

  describe '.list_menu' do
    it 'returns an list of menu items' do
      expect(subject.list_menu).to eq(prices)
    end
  end

  describe '.add_to_basket' do
    it 'adds food to basket' do
      expect(subject.add_to_basket(1)).to eq(["Curry Goat w/ Rice & Peas"])
    end

    it 'can add multiple foods' do
      expect(subject.add_to_basket(1, 2)).to eq(["Curry Goat w/ Rice & Peas", "Curry Goat w/ Rice & Peas"])
    end
  end

  describe '#basket' do
    context 'when food is selected' do
      it 'should hold selected food in basket array' do
        subject.add_to_basket(1)
        expect(subject.basket).to eq(["Curry Goat w/ Rice & Peas"])
      end
    end

    describe '.remove_from_basket' do
      it 'removes food from basket' do
        subject.add_to_basket(1)
        subject.remove_from_basket(1)
        expect(subject.basket).to eq []
      end
    end

    describe '.update_total' do
      context 'when basket holds various items' do
        it 'calculates sum of 1 item basket' do
          subject.add_to_basket(1)
          expect(subject.update_total).to eq(7.99)
        end

        it 'calculates sum of 2 items' do
          subject.add_to_basket(1)
          subject.add_to_basket(2)
          expect(subject.update_total).to eq(16.48)
        end

        it 'calculates sum of 3 items' do
          subject.add_to_basket(1)
          subject.add_to_basket(2)
          subject.add_to_basket(3)
          expect(subject.update_total).to eq(29.47)
        end

      end
    end

  end

end
