require 'food_menu'

describe FoodMenu do
  describe '#initiate' do
    context 'after initiate menue is an array' do
      it 'menu is an array' do
        expect(subject.food_menu).to be_an_instance_of(Array)
      end
    end
  end

  describe '#display_menu_in_category' do
    it { is_expected.to respond_to(:display_menu_in_category) }

    it 'print out menu' do
      # expect(subject.display_menu_in_category).to output("*" * 50).to_stdout
    end
  end
end