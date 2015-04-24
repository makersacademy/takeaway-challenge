require 'menu'

describe Menu do
  let :dishes do
    [
      { name: 'Burger', price: 10.95 },
      { name: 'Pizza', price: 14.00 },
      { name: 'Salad', price: 7.60 },
      { name: 'fries', price: 2.90 }
    ]
  end

  subject { Menu.new }
  it { is_expected.to respond_to(:dishes) }

  describe '#dishes' do
    it 'returns the list of dishes' do
      expect(subject.dishes).to eq dishes
    end
  end

  describe "#add_dish" do
    # it 'can add dishes to it' do
    it "adds the given dish to the list of dishes" do
      new_dish = {name: 'salad', price: 4.0 }
      expect { subject.add_dish(new_dish) }.to change(subject.dishes, :count).by(1)
      expect(subject.dishes).to include new_dish
    end
  end
end
