require 'menu'

describe Menu do

  describe '#initialize' do
    it 'is initialized with menu items' do
      expect(subject.menu_items).not_to be_empty
    end
  end

  describe '#show_menu' do
    it 'responds to show menu' do
      expect(subject).to respond_to(:show_menu)
    end
    it 'formats the menu correctly' do
      test_menu = { "Item 1" => 1.00, "Item 2" => 1.00 }
      expected_output = "Item 1:    £1.00\nItem 2:    £1.00\n"

      expect { subject.show_menu(test_menu) }.to output(expected_output).to_stdout
    end

  end

end
