require 'menu'

output_str = "-----------------------------------
Pizzas
-----------------------------------
 1. Margarita Pizza         £  9.00
 2. Pepperoni Pizza         £ 12.00
 3. Vegetarian Pizza        £ 11.00
 4. Ham and Pineapple Pizza £ 12.50
 5. Meaty Pizza             £ 14.00
-----------------------------------
Sides
-----------------------------------
 6. Garlic Bread            £  3.00
 7. Olives                  £  2.00
 8. Potato Wedges           £  3.50
 9. Chicken Wings           £  5.00
10. Garlic Dip              £  0.50
-----------------------------------
Drinks
-----------------------------------
11. Coke                    £  2.50
12. Lemonade                £  2.50
13. Chocolate Milkshake     £  4.00
14. Vanilla Milkshake       £  4.00
"

describe Menu do
  
  context 'with item double' do

    let(:item_class) { double :item_class, new: item }
    let(:item) { double :item }

    let(:subject) { Menu.new(item_class) }

    it 'should create items from menu.csv by default' do
      expect(subject.items[1]).to eq item
    end

    it 'should be able to select items by id' do
      expect(subject.select(1)).to eq item
    end

  end

  context 'with default menu' do

    it 'should print choices to stdout' do
      expect { subject.print_menu }.to output(output_str).to_stdout
    end

  end

end
