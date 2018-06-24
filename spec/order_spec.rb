require 'order'

describe Order do

  describe 'initialize' do

    it 'should create an empty takeaway_order array' do
      expect(subject.takeaway_order).to be_empty
    end

    it 'should create an empty order balance' do
      expect(subject.balance).to eq(0)
    end

  end

  context 'customer viewing menu of dishes' do
    describe '#view_list' do

      let(:menu) {
        [{ :name => "sushi festival", :price => 3 },
      { :name => "chicken teriyaki dragon roll", :price => 4 },
      { :name => "salmon & avo dragon roll", :price => 5 },
      { :name => "spicy tuna dragon roll", :price => 5 },
      { :name => "veggie dragon roll", :price => 6 }]
      }

      it 'should return a list of dishes' do
      expect(subject.view_list).to eq menu
      end

    end
  end

    describe '#add_order' do

      let(:dish_1) { {:name => "sushi festival", :price => 3} }
      let(:dish_2) { {:name => "chicken teriyaki dragon roll", :price => 4} }

      it 'should allow to select some number of several available dishes' do

      dishes = DishesList.new
      dishes.view_list
      subject.add_order(dish_1)
      subject.add_order(dish_2)
      expect(subject.takeaway_order.length).to eq(2)
    end

    describe '#add_order' do

      let(:dish_1) { {:name => "sushi festival", :price => 3} }
      let(:dish_2) { {:name => "chicken teriyaki dragon roll", :price => 4} }

      it 'should add an order balance' do

        dishes = DishesList.new
        dishes.view_list
        subject.add_order(dish_1)
        subject.add_order(dish_2)
        expect(subject.balance).to eq(7)
      end

    end

  end

end
