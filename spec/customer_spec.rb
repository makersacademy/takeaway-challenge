require 'customer'

describe Customer do

  it {is_expected.to respond_to(:select_dish).with(2).argument}

  it 'should not be able to add dishes not on the menu' do
    expect{subject.select_dish("cars", 3)}.to raise_error 'Dish not on menu'
  end

  it "should be able to select dishes from menu" do
    subject.select_dish("chicken burger meal", 2)
    expect(subject.order).to include("chicken burger meal"=>2)
  end

end
