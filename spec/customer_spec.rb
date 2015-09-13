require 'customer'

describe Customer do

  it 'can check the menu' do
    expect(subject.view_menu).to include(
    'pizza' => 10.00,
    'burrito' => 6.00,
    'burger' => 7.00,)
  end

end
