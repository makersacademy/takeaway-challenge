require_relative '../lib/menu'

describe Menu do
  let(:menu) { Menu.new }

  describe '.list_dishes' do
    it 'shows a list of dishes with prices' do
      expected_output = ""
      
      expected_output << "1. Burger - \u00A33.00\n"
      expected_output << "2. Steak Burger - \u00A34.00\n"
      expected_output << "3. Chicken Burger - \u00A33.00\n"
      expected_output << "4. Veggie Burger - \u00A32.75\n"
      expected_output << "5. Small Lemonade - \u00A30.60\n"
      expected_output << "6. Small Cola - \u00A30.60\n"
      expected_output << "7. Bottled water (500ml) - \u00A30.75\n"
      expected_output << "8. Large Lemonade - \u00A31.00\n"
      expected_output << "9. Large Cola - \u00A31.00\n"
      expected_output << "10. Small Fries - \u00A31.00\n"
      expected_output << "11. Large Fries - \u00A31.50\n"
      expected_output << "12. Garlic Bread - \u00A32.00\n"
      expected_output << "13. Cheesy Garlic Bread - \u00A32.80\n"
      expected_output << "14. Potato Wedges - \u00A32.00\n"
      expected_output << "15. Chocolate Cake Slice - \u00A31.50\n"
      expected_output << "16. Coconut Cake Slice - \u00A31.50"
      
      expect { menu.list_dishes }.to output { expected_output }.to_stdout
    end
  end
end
