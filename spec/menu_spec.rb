require 'menu'

describe Menu do

  it 'should display the menu' do
    expect(subject.display_menu).to eq({ "4x chicken wings" => 1.59,
        "chicken burger meal" => 4.49,
        "fries" => 1.29 })
      end
end
