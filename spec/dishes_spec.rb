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

  it 'check that list of dishes in program matches list in test' do
    expect(subject.list).to eq list_of_dishes
  end

  it 'can read the menu and check prices for items on menu' do
    expect(subject.list.fetch_values('Tuna').join().to_f).to eq(7.99)
  end

  it 'use the check0 method to return the users chosen food list item price.' do
    expect(subject.check('Tuna')).to eq(7.99)
    expect(subject.check('Sweet Shrimp')).to eq(12.49)
  end

end
