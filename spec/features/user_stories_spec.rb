


describe 'User Stories' do
  let(:takeaway) { Takeaway.new }
  let(:menu) { Menu.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context '#menu' do
    it 'is expected to respond to menu' do
      expect { takeaway.menu }.not_to raise_error
    end
    it 'displays a menu with a list of dishes with prices' do
      expect(menu.dishes).to eq ({
        :salad => 12,
        :burger => 14,
        :fajitas => 13,
        :pasta => 8,
        :brownies => 9
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
    expect(takeaway.order(:salad)).to eq "1* #{:salad} added to your basket"
  end





end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
