require './lib/menu'

describe Menu do
  describe '#initialize' do
    it 'is initialized with an empty hash' do
      menu = Menu.new
      expect(menu.contents).to be_kind_of(Hash)
    end
  end
  describe '#add_dish' do
    it 'responds to add_dish' do
      menu = Menu.new
      expect(menu).to respond_to(:add_dish)
    end
    it 'adds a dish' do
      menu = Menu.new
      d1 = double('dish')
      allow(d1).to receive_messages(
      :name => "Chicken Korma",
      :price => 8.99
      )
      menu.add_dish(d1)
      expect(menu).to eq {"Chicken Korma" => 8.99}
    end
  end
end

=begin
double = double('MyClass')
allow(double).to receive_messages(
  :method => 'a string object',
  :give_me_number_five => 5,
  :another_method => []
)
=end