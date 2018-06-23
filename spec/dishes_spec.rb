require 'dishes'

describe Dishes do

  describe '#initalize' do
    let(:menu) { [ { name: "sushi festival", price: 3 } ] }

    it 'should return a list of dishes' do
      expect(subject.menu).to eq menu
    end

  end

  describe '#view_list' do
    let(:menu) { [ { name: "sushi festival", price: 3 } ] }

    it 'should return a list of dishes' do
      expect(subject.view_list).to eq menu
    end

  end

end
