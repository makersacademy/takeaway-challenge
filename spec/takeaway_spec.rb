require 'takeaway'

RSpec.describe Takeaway do
  subject { described_class.new(menu)}
  let (:test_menu) { "Menu:\n1. Salad £1.00\n2. Soup £2.00\n3. Pasta £5.00\n4. Pizza £7.00" }
  let (:menu) {double :menu, display_menu: test_menu}
  describe '#display_menu' do
    it 'displays a list of dishes with prices' do
      expect(subject.display_menu).to eq(test_menu)
    end
  end
end


