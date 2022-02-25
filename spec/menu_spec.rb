require_relative '../lib/menu.rb'

describe Menu do

  describe '#initialize' do
    it 'has a menu with dishes and prices' do
      expect(subject.dishes).to eq [{:Burger=>"£10"}, {:Fries=>"£3"}]
    end
  end
end