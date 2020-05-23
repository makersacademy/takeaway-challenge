require 'takeaway'
require 'menu'

describe Takeaway do
  let(:ta) { Takeaway.new }
  let(:list) { ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"] }
  it 'stores a list of dishes and prices in a hash when initialised' do
    expect(ta.dishes).to eq({ "marinara" => 5, "margherita" => 6, "napoli" => 6, "calzone" => 8 })
  end
  it 'uses the class menu, show_menu method, to make the user visualise dishes in a menu format' do
    expect(ta.visualise_menu).to eq(["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"])
  end
end
