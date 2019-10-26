require 'menu'

RSpec.describe Menu do
  let(:menu) {described_class.new(dish_on_menu)}
  let(:dish_on_menu) do
    {
        keykey: 2.49,
        waakye: 3.99
    }
  end
  describe '#list_dishes' do
    it 'has a list of dishes when initilized' do
      printed_dish = 'keykey £2.49, waakye £3.99'
      expect(menu.list_dishes).to eq(printed_dish)
    end  
  end
end