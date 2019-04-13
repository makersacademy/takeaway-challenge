require 'menu'

describe Menu do
  let(:dish_number){double 1}
  let(:quantity){double 1}

  it 'allows user to view a list of food items and prices' do
    expect(subject.view_menu).to eq(Menu::MENU_LIST)
  end

  describe '#initialize' do
    it 'initially creates an empty basket' do
      expect(subject.basket).to be_empty
    end
  end


  describe '#add_to_basket' do

    it { is_expected.to respond_to(:add_to_basket).with(2).argument }
  end


    it 'places dish in basket' do
      subject.add_to_basket(1,1)
      expect(subject.basket).to include({:kebab=>5})
    end

    it 'places multiple dishes in basket' do
      subject.add_to_basket(1,5)
      expect(subject.basket).to eq [{:kebab=>5},{:kebab=>5},{:kebab=>5},{:kebab=>5},{:kebab=>5}]
    end
  end
