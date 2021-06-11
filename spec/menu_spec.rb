require 'menu'

describe Menu do
  
  let(:dishes) { { vegan_curry: 13,
    veggie_burger: 9,
    chips: 5,
    avo_on_toast: 9,
    mac_n_cheese: 10,
    halloumi_burger: 12 }
  }


  it "should contain a selection of dishes" do
    expect(subject.dishes).to be_a Hash
    expect(subject.dishes).not_to be_empty
  end

  it 'check if menu is displaying price list' do
    expect(subject.dishes).to include({'vegan curry' => 13, 'veggie burger' => 9})
  end

  it 'shows if a dish is not on menu' do
    expect(dishes.include?(:beans_on_toast)).to be false
  end

end