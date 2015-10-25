require 'takeaway'
require 'dish'

describe Takeaway do
  let(:name){ 'Burger' }
  let(:price){ 4.99 }
  let(:dish){ Dish.new(name, price) }
  let(:menu_data){ [dish] }
  let(:menu){ '1'.ljust(10) + name.ljust(20) + price.to_s.rjust(6) }
  subject(:takeaway){ Takeaway.new(menu_data) }


  it 'displays a list of dishes with prices' do
    expect(takeaway.list_dishes).to eq menu
  end


end
