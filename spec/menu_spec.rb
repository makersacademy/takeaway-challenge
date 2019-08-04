require 'menu'
require 'item_list'

describe Menu do

  it_behaves_like ItemList

  let(:dish) { double(:dish, change_cost: 0, name: "Swordfish", cost: 5) }

  it 'displays an empty dish' do

    test_output =  "- Menu --------------------------\n"
    test_output << " Dish Name            |    Price \n"
    test_output << "---------------------------------\n"
    test_output << "---------------------------------\n"


    expect(subject.display).to eq(nil)
    expect { subject.display }.to output(test_output).to_stdout
  end

  it 'cannot remove n item which isn\'t there' do
    expect { subject.remove_menu_item(dish) }.to raise_error(Menu::ERR_MISSING_ITEM)
  end

  context 'with added dish' do
    before(:each) { subject.add_menu_item(dish) }

    it 'displays the dish' do
        test_output =  "- Menu --------------------------\n"
        test_output << " Dish Name            |    Price \n"
        test_output << "---------------------------------\n"
        test_output << " Swordfish            |    £5.00 \n"
        test_output << "---------------------------------\n"

        expect(subject.display).to eq(nil)
        expect { subject.display }.to output(test_output).to_stdout
    end

    it 'cannot add the same dish twice' do
      expect { subject.add_menu_item(dish) }.to raise_error(Menu::ERR_DUPLICATE_ITEM)
    end

    it 'can remove the dish' do
      expect{subject.remove_menu_item(dish)}.to change{subject.items.count}.by (-1)
    end

    it 'can alter a dish based on name' do
      dish2 = double(:dish2, name: "Swordfish", cost: 2)
      expect(dish).to receive(:alter).with(dish2)
      subject.alter_menu_item(dish2)
      expect(subject.items.last).to eq(dish)
    end

  end

  pending 'loads menu from a file'

end
