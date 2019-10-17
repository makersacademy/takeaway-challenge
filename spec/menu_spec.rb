require 'mainmenu'
describe MainMenu do
  it 'checks set menu' do
    basic_menu = {"curry"=>2.2, "name"=>0.0, "pizza"=>5.0}
    expect(subject.dishes).to eq(basic_menu)
  end
end
