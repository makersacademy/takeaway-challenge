require 'menu'

  describe Menu do
    subject(:menu) {described_class.new(dishes)}
    let(:dishes) {double :miso, price: '£2'}

      it 'has a list of dishes with prices' do
        expect(menu.dishes).to eq(dishes)
      end

      it 'displays a list of dishes with prices' do
        takeaway_menu = "Miso soup £2"
        expect(menu.display).to eq(takeaway_menu)
      end

    context 'Given the menu' do
      it 'checks a dish is on the menu' do
        expect(menu.dish_on_menu?("miso soup")).to eq true
      end

      it 'checks if a dish is not on the menu' do
        expect(menu.dish_on_menu?("prawn crackers")).to raise_error 'Sorry, this dish is not on the menu'
      end
    end

      it 'calculates the price of a dish' do

      end

  end
