require 'menu'

describe Menu do

  it 'displays the list of dishes' do
    expect(subject.display).to respond_to :each
  end

  it 'adds dishes to menu list' do
    subject.add_to_menu("fish", 2.00)
    expect(subject.dish_list).to include "fish" => 2.00
  end

end
