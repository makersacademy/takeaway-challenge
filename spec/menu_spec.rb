require 'menu'

describe Menu do
  let(:test_menu) { Menu.new }
  let(:test_menu_display) { TEST_MENU_DISPLAY_STRING }
  let(:test_menu_access) { TEST_MENU_ACCESS }

  describe '#display_menu' do
    it 'displays the takeaway menu' do
      expect(test_menu.display_menu).to eq test_menu_display
    end
  end

  describe '#access' do
    it 'allows direct access to the menu array' do
      expect(test_menu.access).to eq test_menu_access
    end
  end

end

TEST_MENU_DISPLAY_STRING = "MENU\n1. Spicy Edamame  Price: £4.20\n2. Salt and Chilli Vat Chicken Strips  Price: £5.20\n3. Tempura Seaweed Fish  Price: £8.00\n4. Space Whale Sashimi  Price: £16.00\n5. Venerable Dragon Roll  Price: £9.80"

TEST_MENU_ACCESS = [
  { 'Spicy Edamame' => 4.20 },
  { 'Salt and Chilli Vat Chicken Strips' => 5.20 },
  { 'Tempura Seaweed Fish' => 8.00 },
  { 'Space Whale Sashimi' => 16.00 },
  { 'Venerable Dragon Roll' => 9.80 }
]
