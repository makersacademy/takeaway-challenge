require 'customer'

describe Customer do

    it 'can see a list of dishes and prices' do
      expect(subject.see_menu).to eq({ 'plantain fries' => 3,
                                        'banana curry'=> 8,
                                        'banoffee pie'=> 5,
                                        'banana milkshake'=> 3})
  end


  it 'can choose something from the menu' do
    expect(subject.choice_validation('plantain fries')).to eq(:available)
  end

  it 'knows how much a dish costs' do
    expect(subject.price('plantain fries')).to eq('£3')
  end

  it 'can order a few dishes' do
    expect(subject.order('plantain fries', 'banana curry')).to eq ['plantain fries', 'banana curry']
  end

  it 'knows if a dish is not available' do
    expect(subject.order('coffee')).to eq :unavailable
  end

  xit 'knows how the total of the order' do
    order_test = subject.order('plantain fries', 'banana curry', 'banoffee pie')
    p order_test
    expect(subject.total(order_test)).to eq('£16')
  end

end
