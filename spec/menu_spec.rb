require_relative '../lib/menu'

describe Menu do
  let(:menu) { Menu.new }

  describe '.list_dishes' do
    it 'shows a list of dishes with prices' do
      expected_output = "1. Burger - \u00A33.00\n2. Steak Burger - \u00A34.00\n3. Chicken Burger - \u00A33.00\n4. Veggie Burger - \u00A32.75\n5. Small Lemonade - \u00A30.60\n6. Small Cola - \u00A30.60\n7. Bottled water (500ml) - \u00A30.75\n8. Large Lemonade - \u00A31.00\n9. Large Cola - \u00A31.00\n10. Small Fries - \u00A31.00\n11. Large Fries - \u00A31.50\n12. Garlic Bread - \u00A32.00\n13. Cheesy Garlic Bread - \u00A32.80\n14. Potato Wedges - \u00A32.00\n15. Chocolate Cake Slice - \u00A31.50\n16. Coconut Cake Slice - \u00A31.50"
      expect { menu.list_dishes }.to output { expected_output }.to_stdout
    end
  end
end
