require 'menu'

RSpec.describe Menu do
  let (:menu_output) { "Menu:\n1. Salad £1.00\n2. Soup £2.00\n3. Pasta £5.00\n4. Pizza £7.00" }
  let (:display_array) { ["Menu:", "1. Salad £1.00", "2. Soup £2.00", "3. Pasta £5.00", "4. Pizza £7.00"] }
  let (:menu_array) { [{"Salad"=>1.00}, {"Soup"=>2.00}, {"Pasta"=>5.00}, {"Pizza"=>7.00}] }
  describe '#display_menu' do
    it 'outputs a formatted menu' do
      subject.generate_menu
      subject.format_menu
      expect(subject.display_menu).to eq(menu_output)
    end
  end

  describe '#format_menu' do
    it 'converts the menu array into the display array for easy printing' do
      subject.generate_menu
      subject.format_menu
      expect(subject.display_array).to eq(display_array)
    end
  end

  describe '#generate_menu' do
    it 'creates a menu in array form' do
      subject.generate_menu
      expect(subject.menu_array).to eq(menu_array)
    end
  end
  
end