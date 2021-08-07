require 'takeaway_menu'

describe Menu do
  
  let(:full_menu) { { 
    meat_feast_pizza: 7.00,
    pineapple_pizza: 4.00,
    ham_pizza: 3.00, 
    bbq_chicken_pizza: 8.00,
    vegetarian_pizza: 6.00, 
    cheese_pizza: 3.00, 
    pepperoni_pizza: 10.00, 
    the_works_pizza: 5.00
  } }

  describe '#get_menu shows a full list of available dishes and prices' do
    it 'shows the full menu' do
      expect(subject.get_menu).to eq(full_menu)
    end
  end

end
