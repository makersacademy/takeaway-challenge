require 'list_of_dishes'

describe ListOfDishes do

  let(:fish_dish) { double("fake_fish") }
  let(:toast_dish) { double("fake_toast") }

  before(:each) do
    @list_of_dishes = ListOfDishes.new
  end

  it "should be an instance of ListOfDishes" do
    expect(@list_of_dishes).to be_instance_of(ListOfDishes)
  end

  it "should push dishes to list of dishes array" do
    @list_of_dishes.add_dish(fish_dish, toast_dish)

    expect(@list_of_dishes.menu).to eql([fish_dish, toast_dish])
  end

  it "should iterate through dish arguments array" do
    @list_of_dishes.add_dish(fish_dish, toast_dish)

    expect(@list_of_dishes).to receive(:list_by_dish_numbers).with(1, 2).and_return([1, 2])

    @list_of_dishes.list_by_dish_numbers(1, 2)
  end

end
