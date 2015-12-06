


describe 'User Stories' do
  let(:takeaway) { Takeaway.new }
  let(:menu) { Menu.new}
  let(:order) {Order.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context '#menu' do


    it 'displays a menu with a list of dishes with prices' do
      expect(menu.dishes).to eq({
        salad: 12,
        burger: 14,
        fajita: 13,
        pasta: 8,
        brownies: 9
      })
    end

    it 'finds a specific dish and returns the price' do
      expect(menu.dishes[:burger]).to eq 14
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'selects items from the menu which is stored as an order' do
    expect(takeaway.select(:salad, 2)).to eq "You have added 2 salad(s) to your basket"
  end

  it 'returns the total number of dishes' do
    takeaway.select(:salad, 2)
    takeaway.select(:burger, 1)
    expect(takeaway.number_of_dishes).to eq 3
  end

  it 'returns the total number of choices' do
    takeaway.select(:salad, 2)
    takeaway.select(:burger, 1)
    expect(takeaway.order.basket.size).to eq 2
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'returns the sum of the cost of each item ordered' do
    takeaway.select(:salad, 2)
    takeaway.select(:burger, 1)
    takeaway.total_dishes_ordered
    expect(takeaway.total_price).to eq 38
  end



end


#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
