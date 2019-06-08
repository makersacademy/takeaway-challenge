require 'menu'
describe Menu do

  subject(:menu) {descirbed_class.new(dishes)}

  let(:dishes)do
  {
    Air_baked_fries: 6.75,
    Guac_burger: 6.00
  }
  it'shows a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
    end
  end
end 
