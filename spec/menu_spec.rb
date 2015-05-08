require 'menu'

describe Menu do

  let(:dish) { double :dish }

  context 'examining the menu' do

    it 'populates the menu with dishes' do
      subject.add_dish dish
      expect(subject.dishes).to_not be_empty
    end

  end

end