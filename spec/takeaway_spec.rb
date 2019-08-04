require './lib/menu.rb'

describe Takeaway do
  let(:takeaway) { described_class.new }
  let(:pizza1) { 'pepperoni' }
  let(:pizza2) { 'hawaiian' }
  let(:amount) { 2 }

  context 'Menu' do
    it 'Should show a list of dishes and prices' do
      expect(takeaway.view_menu).to eq ({ 'pepperoni' => 10,
                                          'hawaiian' => 12,
                                          'meat feast' => 15,
                                          'vegetarian' => 9,
                                          'spicy sausage' => 11,
                                          'awesome sauce' => 0.59 })
    end
  end

  context 'Order' do
    it 'Should have a default order amount of 1 if no argument given' do
      takeaway.menu_select(pizza2)
      expect(takeaway.view_basket).to eq ['hawaiian = £12']
    end

    it 'Should allow order amount selection' do
      takeaway.menu_select(pizza2, 2)
      expect(takeaway.view_basket).to eq ['hawaiian = £12', 'hawaiian = £12']
    end

    it 'Should give an order total' do
      takeaway.menu_select(pizza1, amount)
      takeaway.menu_select(pizza2, amount)
      expect(takeaway.view_total_price).to eq 'Total  = £44'
    end

    it 'Should allow menu selection to be stored in the order array' do
      takeaway.menu_select(pizza1)
      expect(takeaway.view_basket).to eq ['pepperoni = £10']
    end

    it 'Should raise an error if an item is ordered that is not on the menu' do
      expect { takeaway.menu_select('burger', 2) }.to raise_exception 'Item is not on menu'
    end
  end

  context 'make_payment' do
    it 'Should raise an error if payment does not match total' do
      takeaway.menu_select(pizza1, 2)
      takeaway.menu_select(pizza2, 1)
      takeaway.view_total_price
      expect { takeaway.make_payment(24) }.to raise_exception 'Incorrect payment: The order total is £32.00'
    end
  end

  context 'view_menu' do
    it 'Should allow user to view their order' do
      expect(takeaway).to respond_to(:view_basket)
    end
  end
  context 'User story 4' do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  end
end
