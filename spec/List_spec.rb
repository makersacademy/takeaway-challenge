require 'List'

describe List do
  let(:dish) { double(:dish, :name => :paella, :price => 15) }
#  let(:dish2) { double(:dish, :name => :fish_n_chips, :price => 11) }

  describe '#load_predefined_dishes'
  it 'creates a list of dishes with prices' do
    subject.load_predefined_dishes
    expect(subject.available).to have_at_least(5).dishes
  end

  describe '#add_dishes' do
    it 'new dish to the list' do
      subject.add_dishes dish
      expect(subject.available).to include dish.name
    end
  end

  describe '#select_order_of_food' do
    it 'creates a food-order collection' do
      subject.load_predefined_dishes
      subject.select_food_order :risotto, :lasagna
      expect(subject.food_order).to include(:risotto, :lasagna)
    end

    it 'raises error if food selection not available' do
      subject.add_dishes dish
      expect { subject.select_food_order :risotto }.to raise_error 'Your food selection is not available.'
    end

    describe '#food_order_sum' do
      it 'verifies the sum of all dishes' do
        subject.load_predefined_dishes
        subject.select_food_order :risotto, :lasagna
        #p subject.food_order[:risotto]
        expect(subject.food_order_sum).to eq(subject.food_order[:risotto] + subject.food_order[:lasagna])
      end
    end
  end
end