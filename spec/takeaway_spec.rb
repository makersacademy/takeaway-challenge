require 'takeaway'

describe TakeAway do
  describe '#read_menu' do
    it 'returns a display of everything on the menu (currently hardcoded)' do
      expect(subject.read_menu).to eq({ "Sweet & Sour Chicken Balls" => 3.99,
                                        "Chicken Chowmein" => 4.50,
                                        "Crispy Shredded Beef" => 5.90,
                                        "Egg Fried Rice" => 3.00,
                                        "Fried Duck with Black Bean Sauce" => 6.40 })
    end
  end

  describe '#select_dish' do
    it 'adds a dish to my basket when I select it' do
      subject.add_dish('Egg Fried Rice')
      expect(subject.basket).to eq({"Egg Fried Rice" => 1})
    end

    it 'adds the same dish multiple times to my basket' do
      subject.add_dish('Egg Fried Rice',4)
      expect(subject.basket).to eq({"Egg Fried Rice" => 4})
    end

    it 'adds several different dishes to my basket' do
      subject.add_dish('Egg Fried Rice',4)
      subject.add_dish('Chicken Chowmein',2)
      subject.add_dish('Crispy Shredded Beef',4)
      subject.add_dish('Egg Fried Rice',1)
      expect(subject.basket).to eq({ "Egg Fried Rice" => 5,
                                     "Chicken Chowmein" => 2,
                                     "Crispy Shredded Beef" => 4 })
    end

    it 'fails when you try to add a dish that is not on the menu' do
      expect{subject.add_dish('fish & chips')}.to raise_error("that dish isn't on the menu")
    end
  end

  describe '#basket_total' do
      it 'gives you the total amount currently in your basket when basket is empty' do
        expect(subject.basket_total).to eq 'there is nothing in your basket'
      end

      it 'gives the total amount when one thing is in your basket' do
        subject.add_dish('Egg Fried Rice',1)
        expect(subject.basket_total).to eq '1x Egg Fried Rice = £3.00. Total £3.00'
      end
      
      it 'gives the total amount when one thing is in your basket' do
        subject.add_dish('Egg Fried Rice',4)
        subject.add_dish('Chicken Chowmein',2)
        expect(subject.basket_total).to eq '4x Egg Fried Rice = £12.00 and 2x Chicken Chowmein = £9.00. Total £21.00'
      end

      it 'gives the total amount when one thing is in your basket' do
        subject.add_dish('Egg Fried Rice',4)
        subject.add_dish('Chicken Chowmein',2)
        subject.add_dish('Crispy Shredded Beef',4)
        expect(subject.basket_total).to eq '4x Egg Fried Rice = £12.00, 2x Chicken Chowmein = £9.00 and 4x Crispy Shredded Beef = £23.60. Total £44.60'
      end
  end
end
