require 'order'

describe Order do

  describe 'initialize' do

    it 'should create an empty takeaway_order array' do
      expect(subject.takeaway_order).to be_empty
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

  describe '#add_dish' do

    it 'should allow to select some number of several available dishes' do

      dishes = DishesList.new
      dishes.view_list
      subject.add_order({ name: "sushi festival", price: 3 })
      subject.add_order({ name: "chicken teriyaki dragon roll", price: 4 })
      expect(subject.takeaway_order.length).to eq 2
    end

  end

end
