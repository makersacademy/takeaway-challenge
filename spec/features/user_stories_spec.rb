describe 'User stories' do
  subject(:takeaway) {Takeaway.new(menu)}
  let(:menu) {Menu.new}

  # User story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'returns list with dishes and prices' do
   expect(takeaway.menu_klass.list[:Beer]).to eq 7.00
  end

  # User story 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context 'when selecting order' do
    before do
      takeaway.menu_klass.list
    end

    it 'returns number of choices' do
      takeaway.select_order(:Chicken, 2)
      takeaway.select_order(:Lamb, 3)
      expect(takeaway.complete_order.size).to eq 2
    end

    it 'returns number of dishes' do
      takeaway.select_order(:Chicken, 5)
      takeaway.select_order(:Lamb, 3)
      expect(takeaway.total_of_dishes).to eq 8
    end
  end

  # User story 3
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches
  # the sum of the various dishes in my order
  describe '#total_price' do
    it 'returns total price' do
      takeaway.menu_klass.list
      takeaway.select_order(:Chicken, 5)
      takeaway.select_order(:Lamb, 3)
      takeaway.total_of_dishes
      expect(takeaway.total_price).to eq 16
    end
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was
  # placed and will be delivered before 18:52" after I have ordered
  it 'sends a text confirmation' do
    takeaway.select_order(:Chicken, 5)
    takeaway.select_order(:Lamb, 3)
    
  end

end
