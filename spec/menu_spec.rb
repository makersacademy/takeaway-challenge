require 'menu'

describe Menu do
  describe '#initiate' do
    context 'after initiate' do
      it 'menu is an array' do
        expect(subject.food_menu).to be_an_instance_of(Array)
      end
      it 'menu is not empty' do
        expect(subject.food_menu).to_not be_empty
      end
    end
  end

  describe '#display_menu_in_category' do
    it 'not empty' do
      expect(subject.display_menu_in_category).to_not be_empty
    end
  end

  describe '#get_item' do
    it 'return a hash object with id as 1' do
      expect(subject.get_item("1")["id"]).to eq("1")
    end
  end
end