require 'menu'

describe Menu do
  let(:test_menu) { Menu.new }
  let(:test_menu_display) { TEST_MENU_DISPLAY_STRING }

  describe '#display_menu' do
    it 'displays the takeaway menu' do
      expect(test_menu.display_menu).to eq
    end
  end

end

TEST_MENU_DISPLAY_STRING = "MENU\n1. Spicy Edamame  Price: £4.20\n2. Salt and Chilli Vat Chicken Strips  Price: £5.20\n3. Tempura Seaweed Fish  Price: £8.00\n4. Space Whale Sashimi  Price: £16.00\n5. Venerable Dragon Roll  Price: £9.80"
