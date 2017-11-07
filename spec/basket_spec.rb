require 'basket'
require 'menu'

describe Basket do
  let(:loaded_basket) do
    subject.add(1)
    subject.add(7)
  end

  context 'Adding new items to the basket' do
    describe '#add_item' do

      it "Should add a new item to the user's basket" do
        loaded_basket
        expect(subject.current_order).to eq([{ :dish => "Pizza Rossa", :price => "9" }, { :dish => "Take It Cheesy", :price => "14.5" }])
      end

    end
  end

  context 'Reviewing the current order' do
    describe '#total' do

      it "Should print the total cost of items in @current_order" do
        loaded_basket
        expect(subject.total).to eq 23.5
      end

    end

    describe '#print_basket' do

      it "Should print out all the items in @current_order" do
        loaded_basket
        expect { subject.print_basket }.to output("1. Pizza Rossa, £9.00\n2. Take It Cheesy, £14.50\n").to_stdout
      end

    end
  end
end
