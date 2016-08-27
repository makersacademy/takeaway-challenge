require 'dishes'



describe Dishes do

  let(:test_dishes) { {
    chicken: { name: "Rotisserie chicken",
      price: 14.99,
      quantity: 10
    },
    spinach: {
      name: "Wilted spinach",
      price: 3.50,
      quantity: 80
    }
  }}

  describe '#dishes' do

    it 'should return a list of available dishes and prices' do
      expect(subject.dishes).to eq test_dishes
    end

  end


end
