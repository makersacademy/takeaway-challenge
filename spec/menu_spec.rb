require 'menu'

describe Menu do
  it "should contain a selection of dishes" do
    expect(subject.dishes).to be_a Hash
    expect(subject.dishes).not_to be_empty
  end

  it 'check if menu is displaying price list' do
    expect(subject.dishes).to include({'Vegan curry' => 13, 'Veggie burger' => 9})
  end
end