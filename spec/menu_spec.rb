require 'menu'

describe Menu do
  subject { Menu.new('mock') }
  let(:dish_name_1) { 'dish_1' }
  let(:dish_price_1) { 4.5 }
  let(:add_dish) { subject.add_dish(dish_name_1, dish_price_1) }

  context '#initialize' do
    it '@dishes is empty' do
      expect(subject.dishes.length).to eq 0
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
    let(:one_item_array_return) { [[dish_name_1, dish_price_1]] }

    it 'Returns an copy of @dishes' do
      add_dish
      expect(subject.dishes).to eq one_item_array_return
    end

    it "Items can't be removed from @dishes" do
      add_dish
      subject.dishes.pop
      expect(subject.dishes).to eq one_item_array_return
    end
  end

  context '#print_dishes' do
    it "Prints the dishes nicely" do
      add_dish
      expect(subject.print_dishes).to eq "0. #{dish_name_1} - £#{dish_price_1} \n"
    end
  end
end
