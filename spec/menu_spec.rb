require 'menu'

describe Menu do
  let(:menu){Menu.new}
  let(:dish_carbonara){double(:dish, :name => "Linguine alla carbonara col tartufo", :price => 15)}
  let(:dish_lasagna){double(:dish, :name => "Lasagne in bianco broccoli e salsiccia", :price => 12)}
  let(:dishes_list){[dish_carbonara, dish_lasagna]}

  describe '#dishes' do
    it 'stores an array of dishes' do
      expect{menu.dishes += dishes_list}.not_to raise_error
    end
  end

  describe '#list_dishes' do
    it 'returns a string with all the dishes and they are price' do
      menu.dishes += dishes_list
      dishes_list_str = dishes_list.each { |dish| "#{dish.name.ljust(20,'.')}#{dish.price.to_s.rjust(3,'.')}\n" }
      expect(menu.list_dishes).to eq(dishes_list_str)
    end
  end
end
