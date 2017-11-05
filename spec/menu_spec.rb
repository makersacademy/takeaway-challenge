require 'menu'

describe Menu do
  context 'Printing all items in the menu' do
    describe '#print_menu' do
      it "Should print all items on the menu with an index number starting from 1" do
        expect { subject.print_menu }.to output("1. Pizza Rossa, £9.00\n2. Maggie, £11.00\n3. Vegan Victory, £14.00\n4. Meatfeast, £13.50\n5. Greenman, £13.50\n6. Today Special, £14.00\n7. Take It Cheesy, £14.50\n8. Bello Crudo, £15.00\n9. Vegan Temptations, £14.50\n10. Parmigiana, £15.00\n11. Seitham and Mushrooms, £12.50\n12. Picky Wops Special, £13.00\n13. Ravenous Lumberjack, £13.00\n14. Hot Dickens, £12.50\n15. Protein Punch, £13.00\n16. Tu Vuo' Fa' L'Americano, £14.00\n17. Estate, £13.00\n18. The BombaXXXt, £18.50\n").to_stdout
      end
    end
  end
end

# This test would work much better with a double (seeing as menus can get quite long), but have been unable to find out how to stub STDOUT in RSpec.
