require 'order'

describe Order do

  context 'Check if order has a balance' do
    it '#balance should show a balance' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(5)
      subject.update_order
      expect(subject.balance).to eq 10
  end
 end

  context 'Check if there is an order being placed' do

      it '#update_order should have an order' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(5)
      subject.update_order
      expect(subject.current_order.nil?).to eq false
 end
end

  context 'Checks if the order has been placed in the basket as well' do

    it '#updated_basket should have an order' do
      subject.option("Satay")
      subject.food_quantity(2)
      subject.price(5)
      subject.update_order
      expect(subject.current_order.nil?).to eq false
    end
  end

  context 'Checks whether total price is calculated' do

    it '#total_price should calculate the total price of order'do
    subject.option("Satay")
    subject.food_quantity(2)
    subject.price(5)
    subject.update_order
    subject.update_basket
    expect(subject.total_price).to eq(10)
   end
  end

  context 'Items should be able to be removed from basket' do

    xit '#remove_food can aid to help remove order' do

    end
  end
end
