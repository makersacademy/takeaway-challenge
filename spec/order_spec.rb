require 'order'
require 'menu'

describe Order do

  describe '#add_dish' do
    context 'when the basket is empty' do
      it "return the list of added item" do
        actual = subject.add_dish(1)
        expected = { "prawn crackers" => [199, 1] }
        expect(actual).to eq expected
      end
    end

    context 'when the basket has item in already' do
      it "return the list with the new item added in" do
        basket = { "prawn crackers" => [199, 2] }
        actual = Order.new(basket).add_dish(3)
        expected = {
          "prawn crackers" => [199, 2],
          "vagetable dumplings" => [599, 1]
        }
        expect(actual).to eq expected
      end
    end

    context 'when the basket already has the item you want to add in' do
      it "return the list with the updated quantity of the item" do
        basket = { "prawn crackers" => [199, 2] }
        actual = Order.new(basket).add_dish(1)
        expected = {
          "prawn crackers" => [199, 1]
        }
        expect(actual).to eq expected
      end
    end
  end

  describe '#basket_summary' do
    it 'return the summary of the order' do
      basket = {
          "prawn crackers" => [199, 2],
          "vagetable dumplings" => [599, 1]
        }
      actual = Order.new.basket_summary(basket)
      expected = {
          "prawn crackers" => 398,
          "vagetable dumplings" => 599
        }
      expect(actual).to eq expected
    end
  end

  describe '#total_cost' do
    context 'when the total matches the sum of the order' do
      it 'return the total cost of the order' do
        basket_summary = {
            "prawn crackers" => 3.98,
            "vagetable dumplings" => 5.99
          }
        actual = Order.new.total_cost(basket_summary)
        expected = 9.97
        expect(actual).to eq expected
      end
    end
  end

   describe '#place_order' do
     context 'when the payment_amount does not match the sum of the order' do
       it 'raise an error message' do
         basket_summary = {
             "prawn crackers" => 398,
             "vagetable dumplings" => 599
           }
         expect{ Order.new.place_order(1100, basket_summary) }.to raise_error ("Sorry, the payment amount is incorrect")
       end
     end

     context 'when the payment_amount does match the sum of the order' do
       it 'return a confirmation message' do
         basket_summary = {
             "prawn crackers" => 398,
             "vagetable dumplings" => 599
           }
         time = (Time.now + 3600).strftime("%H:%M")
         expect( Order.new.place_order(997, basket_summary) ).to eq "Thank you! Your order was placed and will be delivered before #{time}"
       end
     end
   end

end
