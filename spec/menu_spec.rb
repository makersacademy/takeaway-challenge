require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  it 'presents a list of dishes with prices' do
    expect(menu).to include (:pizza_deluxe)
    expect(menu[:pizza_deluxe]).to eq (15)

    expect(menu).to include (:hamburger)
    expect(menu[:hamburger]).to eq (12)
  end
  
end
