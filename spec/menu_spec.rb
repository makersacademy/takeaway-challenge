require 'menu'

describe Menu do
  describe "#show_menu" do
    it 'should show all items in the menu with their respective prices' do
      expect { subject.show_menu }.to output("1. Fried Rice £6.00\n2. Chow Mein £6.10\n3. Chop Suey £6.20\n4. Satay £6.30\n5. Salt & Pepper £6.40\n6. Sweet & Sour £6.50\n7. Chips £1.50\n8. Large Chips £2.00\n9. Fish £3.00\n10. Sausage £1.20\n11. Pie £1.30\n12. Gravy £1.00\n13. Peas £0.80\n14. Spring Rolls £2.80\n").to_stdout
    end
  end
end
