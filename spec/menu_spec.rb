require_relative '../lib/menu'

describe Menu do
  let(:menu) { Menu.new }

  let(:list_of_dishes) {
    list_of_dishes = ""
    
    list_of_dishes << "1. Burger - \u00A33.00\n"
    list_of_dishes << "2. Steak Burger - \u00A34.00\n"
    list_of_dishes << "3. Chicken Burger - \u00A33.00\n"
    list_of_dishes << "4. Veggie Burger - \u00A32.75\n"
    list_of_dishes << "5. Small Lemonade - \u00A30.60\n"
    list_of_dishes << "6. Small Cola - \u00A30.60\n"
    list_of_dishes << "7. Bottled water (500ml) - \u00A30.75\n"
    list_of_dishes << "8. Large Lemonade - \u00A31.00\n"
    list_of_dishes << "9. Large Cola - \u00A31.00\n"
    list_of_dishes << "10. Small Fries - \u00A31.00\n"
    list_of_dishes << "11. Large Fries - \u00A31.50\n"
    list_of_dishes << "12. Garlic Bread - \u00A32.00\n"
    list_of_dishes << "13. Cheesy Garlic Bread - \u00A32.80\n"
    list_of_dishes << "14. Potato Wedges - \u00A32.00\n"
    list_of_dishes << "15. Chocolate Cake Slice - \u00A31.50\n"
    list_of_dishes << "16. Coconut Cake Slice - \u00A31.50\n"

    list_of_dishes
  }

  describe '.list_dishes' do
    it 'shows a list of dishes with prices' do      
      expect(menu.list_dishes).to eq list_of_dishes
    end
  end
end
