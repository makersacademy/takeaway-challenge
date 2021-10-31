require './lib/menu'

describe Menu do

  let(:dish) { { :name => "Chips", :price => 2 } }

  describe '#initialize' do
    it 'has a dishes attribute that has individual dishes with a name and price' do
      expect(subject.dishes).to_not eq nil
    end
  end
  
  describe 'view_menu' do

    it 'displays menu with dishes and their price' do
      expect(subject.view_menu).to include dish
    end
  end
end
