require 'sandcream'

describe Sandcream do

  it { is_expected.to respond_to(:print_sando) }
  it { is_expected.to respond_to(:print_icecream) }
  
  describe '#initialize' do
    it 'sando_menu array' do
      expect(subject.sando_menu).to eq([
        { sando: '1. Submarine Club - Tuna Salad', price: 9.50 },
        { sando: '2. Clubster Cluck - Grilled Chicken', price: 9.50 },
        { sando: '3. Shrimpy Sea Chanty - Prawn Cocktail', price: 10.50 },
        { sando: '4. Sweet Home Avocado - All Veggie', price: 9.00 },
        { sando: '5. Big City Life - Smoked Salmon & Cream Cheese', price: 10.50 },
        { sando: '6. Bologna Baloney- Pistachio Mortadella', price: 11.00 },
        { sando: '7. Egg Slut Sando - Egg Salad', price: 8.50 }])
    end

    it 'checks length is correct' do
      expect(subject.sando_menu.length).to eq 7
    end

    it 'icecream_menu array' do
      expect(subject.icecream_menu).to eq([
        { icecream: '8. Black & Gold - Tahini & Kharoub', price: 6.00 },
        { icecream: '9. Blueberry Hill - Blueberry Cheesecake', price: 5.50 },
        { icecream: '10. Strawberry Fields Forever - Strawberry & Cream', price: 5.50 },
        { icecream: '11. Cookie Thumper - Cookie Dough Vanilla Ice Cream', price: 5.50 },
        { icecream: '12. Watermelon Sugar - Watermelon Sorbet', price: 4.00 }, 
        { icecream: '13. Banana Pancakes - Banana & Peanut Butter', price: 5.50 }, 
        { icecream: '14. Lemon Tree - Amalfi Lemon Limoncello', price: 7.50 }])
    end

    it 'checks length is correct' do
      expect(subject.icecream_menu.length).to eq 7
    end
  end

  describe '#print_sando' do
    it 'prints sando selection' do
      expect(subject.print_sando).to eq(subject.sando_menu)
    end
  end

  describe '#print_icecream' do
    it 'prints ice cream selection' do
      expect(subject.print_icecream).to eq(subject.icecream_menu)
    end
  end
end
