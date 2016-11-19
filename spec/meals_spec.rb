require 'meals'

describe Meals do

  it 'has a list of dishes' do
    expect(subject.menu_list).to eq([])
  end

  it 'saves dishes with their prices' do
    expect(subject.add_meal("meal", 2)).to eq( [{:meal => "meal", :price => 2}] )
  end

  it 'adds new meals to the menu' do
    expect{subject.add_meal("meal", 2.0)}.to change{subject.menu_list}
  end

end
