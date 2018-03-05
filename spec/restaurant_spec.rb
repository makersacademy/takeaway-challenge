require 'restaurant'

describe Restaurant do
  subject(:chelo) { Restaurant.new }
  let(:menu){ double :menu }

  describe '#initialize' do

    it 'should check to see if menu has been created' do
      expect(!!chelo.menu).to be(true)
    end

    it 'should confirm there is an empty basket' do
      expect(chelo.basket).to be_empty
    end

  end


  describe '#display_menu' do

    it 'should check to see if a menu is put to screen' do
      expect(chelo.display_menu).to include(chelo.menu)
    end

  end

  describe '#add_to_basket' do
    let(:selection) { 1 }

    it 'should put user_selection in basket' do
      chelo.add_to_basket(selection)
      expect(chelo.basket[0]).to include(chelo.menu.keys[selection])
    end

  end

  # describe '#display_basket' do
  #   let(:selection) { 1 }
  #
  #   it 'should display the basket' do
  #     chelo.add_to_basket(selection)
  #     expect(chelo.display_basket).to include(chelo.basket[-1].keys[0])
  #   end
  # end

  

end
