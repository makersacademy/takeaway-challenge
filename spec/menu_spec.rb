require 'menu'

describe Menu do
  it 'should display the complete menu' do
    expect(subject.show_menu).to eq "chicken"=>3, "fish"=>2, "pork"=>3
  end
end
