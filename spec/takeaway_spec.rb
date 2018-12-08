require './lib/takeaway.rb'

describe 'Takeaway' do
  let (:takeaway) { Takeaway.new }
  let (:menu) { { 'Chicken Pie' => 5,
      'Beef Pie' => 6,
      'Liver Pie' => 3,
      'Steak and Kidney' => 3,
      'Chicken and Leak' => 6
    } }
    it 'can display a menu' do
      expect(takeaway).to respond_to :show_menu
    end

    it 'Prints a menu' do
      expect(takeaway.show_menu).to eq(menu)
    end
  end
