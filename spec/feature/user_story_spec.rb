
describe 'user stories' do
  subject(:takeaway) { Takeaway.new(menu) }
  subject(:menu) { Menu.new }
  #User story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'returns a list of dishes with prices' do
    expect(takeaway.menu_klass).to respond_to(:list)
  end

  it 'returns an item from the list' do
    expect(takeaway.menu_klass.list[:Cobra]).to eq (3.50)
  end

  context 'when selecting an order' do
    before do
      takeaway.menu_klass.list
    end
    #User story 2
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'returns number of choices' do
      takeaway.select_order(:Lamb_curry, 2)
      takeaway.select_order(:Prawn_curry, 3)
      expect(takeaway.complete_order.size).to eq 2
    end

    it 'returns number of dishes' do
      takeaway.select_order(:Lamb_curry, 2)
      takeaway.select_order(:Prawn_curry, 3)
      expect(takeaway.total_of_dishes).to eq 5
    end
  end

  context 'when finalising an order' do
    it 'checks the sum for my total order' do
      # As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of
      #the various dishes in my order
      takeaway.menu_klass.list
      takeaway.select_order(:Lamb_curry, 2)
      takeaway.select_order(:Prawn_curry, 3)
      takeaway.total_of_dishes
      expect(takeaway.total_price).to eq 23
    end

    it 'confirms order and delivery time via text message' do
      # As a customer
      # So that I am reassured that my order will be delivered on time
      # I would like to receive a text such as "Thank you! Your order was placed
      # and will be delivered before 18:52" after I have ordered
      
    end

  end
end
