require 'menu'

describe Menu do
  let(:dish1) { double(:dish, :name => "Baked Potato", :price => 3.25) }
  let(:dish2) { double(:dish, :name => "Spaghetti Bolognese", :price => 4.70) }
  let(:test_menu) { described_class.new(dish1, dish2) }

  it 'stores dishes passed as arguments to @dishes on creation' do
    expect(test_menu).to have_attributes(:dishes => [dish1, dish2])
  end

end
