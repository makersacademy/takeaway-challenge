require 'menu'

describe Menu do

  it 'displays the list of dishes' do
    expect(subject.display).to respond_to :each
  end

  it 'adds items to the menu' do
    subject.add_to_menu("kopytka", 2.00)
    expect(subject.dish_list).to include "kopytka" => 2.00
  end

end
