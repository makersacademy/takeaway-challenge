require 'food'

describe Food do
  it "creates with a unique menu ID" do
    expect(Food.new.id).to eq(1)
    expect(Food.new.id).to eq(2)
    expect(Food.new.id).to eq(3)
  end
end