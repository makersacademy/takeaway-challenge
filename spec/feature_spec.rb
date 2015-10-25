require 'takeaway'
require 'dish'

describe 'Feature tests' do
  let(:name){ 'Burger' }
  let(:price){ 4.99 }
  let(:dish){ Dish.new(name, price) }
  let(:menu_array){ [dish] }
  let(:menu_string){ '1'.ljust(10) + name.ljust(20) + price.to_s.rjust(6) + "\n" }
  subject(:takeaway){ Takeaway.new(menu_array) }


  it 'displays a list of dishes with prices' do
    expect(takeaway.list_dishes).to eq menu_string
  end


end
