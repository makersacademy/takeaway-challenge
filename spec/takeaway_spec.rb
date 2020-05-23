require 'takeaway'

describe Takeaway do
  let(:ta) { Takeaway.new }
  it 'stores a list of dishes and prices in a hash when initialised' do
    expect(ta.dishes).to eq([{ "marinara" => 5 }, { "margherita" => 6 }, { "napoli" => 6 }, { "calzone" => 8 }])
  end
end
