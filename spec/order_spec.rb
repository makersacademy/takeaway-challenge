require 'order'
require 'menu'
describe Order do

  describe '#add_dish' do
    context 'when the basket is empty' do
      it "return the list of added item" do
        actual = subject.add_dish(1)
        expected = { "prawn crackers" => [1.99, 1] }
        expect(actual).to eq expected
      end
    end

    context 'when the basket has item in already' do
      it "return the list with the new item added in" do
        basket = { "prawn crackers" => [1.99, 2] }
        actual = Order.new(basket).add_dish(3)
        expected = {
          "prawn crackers" => [1.99, 2],
          "vagetable dumplings" => [5.99, 1]
        }
        expect(actual).to eq expected
      end
    end

    context 'when the basket already has the item you want to add in' do
      it "return the list with the updated quantity of the item" do
        basket = { "prawn crackers" => [1.99, 2] }
        actual = Order.new(basket).add_dish(1)
        expected = {
          "prawn crackers" => [1.99, 1]
        }
        expect(actual).to eq expected
      end
    end
  end

  describe '#check_out' do
    describe 'check the total is given matches the sum in the order' do
      it "return the total amount " do

      end
    end
  end

end
