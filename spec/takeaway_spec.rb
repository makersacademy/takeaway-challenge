require 'takeaway'

describe Takeaway do

  it 'shows a menu' do
    expect(subject.menu).to_not be_empty
  end

  describe "Ordering" do

    let(:item) { subject.menu.keys[0] }
    let(:item2) { subject.menu.keys[1] }

    it 'Basket exists' do
      expect(subject.basket).to be_empty
    end

    context '#add_item(item, quantity)' do

      it 'allows to add an item to the basket' do
        subject.add_item(item)
        expect(subject.basket[item]).to eq 1
      end

      it 'allows to add multiples of items' do
        subject.add_item(item, 3)
        expect(subject.basket[item]).to eq 3
      end

      it 'does not allow zero or negative quantities' do
        message = "Negative or zero quantities not allowed"
        expect{ subject.add_item(item, -1) }.to raise_error message
      end

      it 'checks whether the item actually exists on the menu' do
        message = "bla bla is not on the menu!"
        expect{ subject.add_item("bla bla") }.to raise_error message
      end

    end

    context '#basket_summary' do

      it 'shows the summary of the basket' do
        line = "#{item} x3 = £#{(subject.menu[item] * 3).round(2)}" \
               ", #{item2} x2 = £#{(subject.menu[item2] * 2).round(2)}"
        subject.add_item(item, 3)
        subject.add_item(item2, 2)
        expect(subject.basket_summary).to eq line
      end

    end

    context '#total' do

      it 'shows the total amount for the order' do
        subject.add_item(item)
        subject.add_item(item2, 3)
        cost = subject.menu[item] + (subject.menu[item2] * 3).round(2)
        expect(subject.total).to eq "Total cost: £#{cost}"
      end

    end

    context '#checkout' do

      it 'does not allow to checkout if basket is empty' do
        expect{ subject.checkout(1.00) }.to raise_error "Your basket is empty!"
      end

      it 'does not allow to checkout if given amount is less than total' do
        subject.add_item(item)
        message = "Amount given is less than total cost"
        expect{ subject.checkout(0.01) }.to raise_error message
      end

      it 'accepts payment (including any tips) and confirms the order' do
        subject.add_item(item)
        expect(subject).to receive(:confirm_order).and_return(nil)
        subject.checkout(subject.menu[item])
      end

    end

  end

end
