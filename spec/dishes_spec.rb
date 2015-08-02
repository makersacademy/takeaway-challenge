require 'dishes'

describe Dishes do
  it 'generates instances of dish' do
    Dishes.new
    expect($all_dish.count).to be > 0
  end

  it 'can make new dish' do
    subject.new_dish :beef, 6
    expect($all_dish).to include(:beef => 6)
  end
end
