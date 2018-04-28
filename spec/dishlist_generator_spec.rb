describe Dishlist_generator do

  let(:menu_handler) { instance_double 'Menu_handler'}
  let(:dish) { instance_double 'Dish' }
  let(:dish_class) { double :dish_class }
  subject(:dishlist_generator) { described_class.new(dish_class: dish_class, menu_handler: menu_handler)}
  let(:menu_items) { [
                      { item: "item1", description: "description", price: "price" },
                      { item: "item2", description: "description", price: "price" }
                      ] }
  before do
    allow(menu_handler).to receive(:get__menu_items).with(anything).and_return(menu_items)
    allow(dish_class).to receive(:new).with(anything).and_return(dish)
  end

  describe '#create_list' do
    let(:dishes) { subject.create_list("arg") }

    it 'creates an array of dish objects' do
      expect(dishes).to contain_exactly(dish, dish)
    end

    it 'creates an array of dish objects' do
      expect(dishes.count).to eq 2
    end
  end

end
