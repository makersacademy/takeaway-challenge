require './lib/takeaway.rb'

describe 'Takeaway' do
  let (:takeaway) { Takeaway.new('Pollys Pie Emporium') }
  let (:menu) { Menu.new }


    it 'can display a menu' do
      expect(takeaway).to respond_to :display_menu
    end

    it 'Prints a menu' do #test identified as vacuous, would be refactored later
      expect(takeaway.display_menu).to eq(menu.show_menu)
    end

    it 'Creates an order' do
      norder = takeaway.create_order
      norder.add('Chicken Pie')
      expect(norder.cart).to eq([{'Chicken Pie' => 5}])
    end


  end
