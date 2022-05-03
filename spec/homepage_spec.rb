require 'homepage'

describe Homepage do

  it 'creates a new instance of Homepage class' do
    expect(subject).to be_an_instance_of(Homepage)
  end

  describe '# display_restaurants' do
    it 'prints a list of restaurants' do
      expect(subject.display_restaurants).to be_an_instance_of(String)
    end

    # it 'should list restaurants with corresponding csv files' do
    #   ???
    # end
  end

  describe '# see_restaurant_menu' do
    it 'creates an instance of menu' do
      subject.see_restaurant_menu('pizza')

      expect(subject.currently_viewed_menu).to be_an_instance_of Menu
    end

    it 'displays the selected menu' do
      text = "Margherita, £9.00\nCured Meat, £12.50\nAnchoa, £12.50\nThe Devil, £12.50\nFlorence, £12.50\nMarinara, £7.50\nNew Yorker, £13.50"

      expect(subject.see_restaurant_menu('pizza')).to eq text
    end

    describe '# create_order' do
      it 'creates new instnace of order' do
        expect(subject.create_order('pizza')).to be_an_instance_of(Order)
      end
    end
  end
end