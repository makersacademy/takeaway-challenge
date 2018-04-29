require 'menu'

describe Menu do
  let(:object_type) { class_double(Dish, new: new) }
  subject { Menu.new(object_type) }

  let(:dish_id_1) { 1 }
  let(:dish_name_1) { double(:dish_name_1, name: 'dish_1') }
  let(:dish_price_1) { double(:dish_price_1, price: 4.5) }
  let(:new) { double(:new, id: dish_id_1, name: dish_name_1, price: dish_price_1) }

  let(:add_dish) { subject.add_dish(dish_name_1, dish_price_1) }

  context '#initialize' do
    it '@dishes is empty' do
      expect(subject.dishes).to be_empty
    end
  end

  context '#add_dish' do
    it 'Can add a dish' do
      expect(add_dish).to eq "Dish added: #{dish_name_1} - £#{dish_price_1}"
    end
    it 'Raises an error if a dish with that name exists already' do
      add_dish
      expect { subject.add_dish(dish_name_1, dish_price_1) }.to raise_error RuntimeError
    end
  end

  context '#dishes' do
    it 'Returns the objects of @dishes' do
      add_dish
      expect(subject.dishes).to include new
    end

    it "Items can't be removed from @dishes" do
      add_dish
      subject.dishes.pop
      expect(subject.dishes.length).to eq 1
    end
  end

  context '#print_dishes' do
    it "Prints the dishes nicely" do
      add_dish
      expect(subject.print_dishes).to eq "#{dish_id_1}. #{dish_name_1} - £#{dish_price_1} \n"
    end
  end
end
