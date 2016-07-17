require 'menu'

describe Menu do
  it {is_expected.to respond_to(:display)}

  it 'displays the list of dishes' do
    subject.add_to_menu("pizza", 3)
    expect(subject.display).to eq subject.dish_list
  end

  it 'adds items to menu list' do
    subject.add_to_menu("fish", 2)
    expect(subject.dish_list).to include "fish" => 2
  end

end
