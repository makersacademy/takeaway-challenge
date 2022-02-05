require_relative '../lib/order'

describe Order do
  let (:Takeaway) { double :Takeaway }

  describe 'view_menu' do
    it 'should display the menu from the takeaway' do
      test_menu = { "Dish 1" => 10, "Dish 2" => 12 }
      allow(Takeaway).to receive(:view_menu).with(Takeaway) { test_menu }
      expect(subject.view_menu(Takeaway)).be eq( { "Dish 1" => 10, "Dish 2" => 12 } )
    end
  end
end
