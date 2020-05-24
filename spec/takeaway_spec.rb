require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:list) { ["marinara - £5", "margherita - £6", "napoli - £6", "calzone - £8"] }

  it 'stores a list of dishes and prices in a hash when initialised' do
    expect(subject.dishes).to eq({ "marinara" => 5, "margherita" => 6, "napoli" => 6, "calzone" => 8 })
  end
  it 'uses the class menu, show_menu method, to make the user visualise dishes in a menu format' do
    expect(subject.visualise_menu).to eq(list)
  end

  it 'interacts with Order class to add dishes to the current order and return message' do
    expect(subject.add_to_order("marinara", 2)).to eq("marinara X 2 added to your order")
    # expect(subject.order.items).to eq({ "marinara" => 2 })
  end

  it 'raise an error if the dish is not in the dish list' do
    expect { subject.add_to_order("prosciutto") }.to raise_error("item not available")
  end

end
