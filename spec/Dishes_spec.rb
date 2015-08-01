require 'dishes'

describe Dishes do

  it 'displays the food menu and prices' do
    expect(subject.display_menu).to eq ({ "chow mein" => 2.99, "egg fried rice" => 1.99, "spring rolls" => 2.99 })
  end

end