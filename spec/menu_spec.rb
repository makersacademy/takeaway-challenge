require 'menu'

describe Menu do
  describe '#print' do
    it 'prints a menu' do
      expect { subject.print }.to output("Burgers\n  1. Cheeeseburger  7.5\n  2. Bambi  8.0\n  3. Veggie Surprise  7.5\n  4. Halloumi & Rocket  7.0\n  5. Mac 'n' Cheeseburger  6.5\nSides\n  6. Chips  2.5\n  7. Truffle Polenta Chips  3.5\n  8. Mushy Peas  2.0\n  9. Cauliflower Cheese  6.5\nDrinks\n  10. Chardonnay  5.5\n  11. Corona  4.5\n  12. Gin & Tonic  5.0\n").to_stdout
    end
  end
end
