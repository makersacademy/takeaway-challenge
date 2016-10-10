require "takeaway.rb"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'shows the menu which includes a list of dishes and prices.' do
  expect(takeaway.menu).to eq ({ "dough balls"=>5, "margherita"=>8, "fiorentina"=>10, "veneziana"=>10, "american hot"=>11})
end

end
