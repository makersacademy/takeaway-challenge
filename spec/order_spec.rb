require 'order'
require 'menu'

describe Order do
  let(:basket) { { "prawn crackers" => [199, 2] } }
  let(:basket1) { {
      "prawn crackers" => [199, 2],
      "vagetable dumplings" => [599, 1]
    } }
  let(:basket_summary) { {
      "prawn crackers" => 398,
      "vagetable dumplings" => 599
    } }
  let(:time) { Time.parse("2018-01-20 20:17:40") }
  subject(:order) { described_class.new }

  describe '#add_dish' do
    context 'when the basket is empty' do
      it "return the list of added item" do
        expect(subject.add_dish(1)).to eq ({ "prawn crackers" => [199, 1] })
      end
    end

    context 'when the basket has item in already' do
      it "return the list with the new item added in" do
        expect(Order.new(basket).add_dish(3)).to eq ({
          "prawn crackers" => [199, 2],
          "vagetable dumplings" => [599, 1]
        })
      end
    end

    context 'when the basket already has the item you want to add in' do
      it "return the list with the updated quantity of the item" do
        expect(Order.new(basket).add_dish(1)).to eq ({
          "prawn crackers" => [199, 1]
        })
      end
    end
  end

  describe '#basket_summary' do
    it 'return the summary of the order' do
      expect(order.basket_summary(basket1)).to eq ({
          "prawn crackers" => 398,
          "vagetable dumplings" => 599
        })
    end
  end

  describe '#total_cost' do
    context 'when the total matches the sum of the order' do
      it 'return the total cost of the order' do
        expect(order.total_cost(basket_summary)).to eq 997
      end
    end
  end

  describe '#print_receipt' do
    it 'print the receipt with all the details' do
      details = "prawn crackers  £3.98\nvagetable dumplings  £5.99"
      expect(order.print_receipt(basket_summary, 997)).to eq (details + "\n-----------------------\n" + "Total:  £#{997 / 100.0}")
    end
  end

  describe '#place_order' do
    context 'when the payment_amount does not match the sum of the order' do
      it 'raise an error message' do
        expect{ order.place_order(1100, basket_summary, time) }.to raise_error ("Sorry, the payment amount is incorrect")
      end
    end

    context 'when the payment_amount does match the sum of the order' do
      it 'return a confirmation message' do
        time_new = "21:17"
        expect( order.place_order(997, basket_summary, time) ).to eq "Thank you! Your order was placed and will be delivered before #{time_new}"
      end
     end
   end

end
