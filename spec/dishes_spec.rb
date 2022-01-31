require 'dishes'

describe Dishes do
  
  let :list_of_dishes do
    { 'Tuna' => 7.99,
      'Spanish Mackerel' =>  6.54,
      'Sweet Shrimp' =>  12.49,
      'Saltwater Eel' =>  15.54,
      'Round Clam' =>  15.44,
      'Albacore White Tuna' =>  3.25,
      'Skipjack Tuna' =>  5.44,
      'Yellow Tail' =>  11.88 }
  end

  it 'check that dishes has a hash of dishes with prices' do
    expect(subject).to respond_to(:list)
  end

  it 'has a list of dishes and prices' do
    expect(subject.list).to eq list_of_dishes
  end

  it 'can read the menu and check prices for items on menu' do
    expect(subject.list[5][1]).to eq { 1 }
  end

end
