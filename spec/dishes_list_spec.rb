require 'dishes_list'

describe DishesList do

  describe '#initalize' do
    let(:menu) {
      [{ :name => "sushi festival", :price => 3 },
    { :name => "chicken teriyaki dragon roll", :price => 4 },
    { :name => "salmon & avo dragon roll", :price => 5 },
    { :name => "spicy tuna dragon roll", :price => 5 },
    { :name => "veggie dragon roll", :price => 6 }]
    }

    it 'should return a list of dishes' do
      expect(subject.menu).to eq(menu)
    end

  end

  describe '#view_list' do
    let(:menu) {
      [{ :name => "sushi festival", :price => 3 },
    { :name => "chicken teriyaki dragon roll", :price => 4 },
    { :name => "salmon & avo dragon roll", :price => 5 },
    { :name => "spicy tuna dragon roll", :price => 5 },
    { :name => "veggie dragon roll", :price => 6 }]
    }

    it 'should return a list of dishes' do
      expect(subject.view_list).to eq(menu)
    end

  end

end
