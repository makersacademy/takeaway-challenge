require 'dishes'
describe Dishes do

  context 'When asking for an list' do
    it 'have a list of dishes' do
      subject.list
      p subject.menu
      expect(subject.menu).to be_a Array
    end

    it 'prints the list of dishes' do
      subject.list
      expect(subject.menu[0]).to eq ({:dish=>:Pancake, :price=>1})
      expect(subject.menu[1]).to eq ({:dish=>:Chocolate_pancake, :price=>1.5})
      expect(subject.menu[-1]).to eq ({:dish=>:Banana_shake, :price=>3.2})
    end
  end

end
