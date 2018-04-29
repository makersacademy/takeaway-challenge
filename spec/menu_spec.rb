require 'menu'

describe Menu do
  let(:dish) {double :dish, name: "Chicken Burger", price: 2.00, quantity: 3}
  let(:dish_class) {double :dish_class, new: dish}
  subject {Menu.new(dish_class)}

  it 'has a view_menu method' do
    expect(subject).to respond_to(:view_menu)
  end

  it 'view menu returns nil' do
    expect(subject.view_menu).to eq nil
  end
  it 'loads a csv file and saves it to menu csv' do
    expect(subject.menu_csv).to be_an_instance_of(Array)
  end

  describe '#dishes' do
    it 'should have a collection of dishes' do
      expect(subject).to respond_to(:dishes)
    end
    it 'is a empty array' do
      expect(subject.dishes).to eq []
    end
  end

  describe '#menu_load' do
    it 'should add 4 instances to dishes' do #cannot stub menu_csv inside
      subject.instance_variable_set(:@menu_csv,[["Chicken Burger", "9.95", "3"],
                                            ["Beef Burger", "8.75", "2"],
                                            ["Chilli Burger", "10.95", "4"],
                                            ["Fritter Burger", "7.95", "2"]] )
      subject.menu_load
      expect(subject.dishes.length).to eq 4
    end

  end
end
