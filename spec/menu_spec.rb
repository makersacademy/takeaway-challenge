require 'menu'

describe Menu do

  it { is_expected.to respond_to :dishes }

  describe '#show_menu' do
    it 'should show a food type and its price' do
      subject.instance_variable_set("@dishes", [{ "edemame" => 3 }])
      expect(subject.show_menu).to eq [{ "edemame" => 3 }]
    end

    xit 'should show a food type and its price in a readable way' do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }])
      expect(subject.show_menu).to eq "1. 'generic_food', £5.00"
    end
  end

  describe '#order_item' do
    it 'has an empty array, @basket' do
      expect(subject.basket).to eq []
    end

    it 'should copy an item from @dishes to @basket' do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }, { 'another_food' => 10 }])
      subject.order_item(2, 1)
      expect(subject.basket).to eq [{ 'another_food' => 10 }]
      expect(subject.dishes).to eq [{ 'generic_food' => 5 }, { 'another_food' => 10 }]
    end

    it 'should be able to add multiples of a dish to @basket' do
      subject.instance_variable_set("@dishes", [{ 'generic_food' => 5 }, { 'another_food' => 10 }])
      subject.order_item(2, 2)
      expect(subject.basket).to eq [{ 'another_food' => 10 }, { 'another_food' => 10 }]
    end
  end

end
