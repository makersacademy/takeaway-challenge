require 'dishes'

describe Dishes do


  it { is_expected.to respond_to(:menu)}


  it 'allows user to see a dishes with prices' do
    dish = Dishes.new
    expect(dish.menu).to include({ "shoes" => 78 })
  end

  it 'shows whole list of dishes' do
    dish = Dishes.new
    message = "Beatrice's restaurant menu\n1: Seeds £50\n2: Eyeballs £25\n3: Camel Breast £40\n4: shoes £78\n"
    expect{ dish.viewlist }.to output(message).to_stdout
   end


end
