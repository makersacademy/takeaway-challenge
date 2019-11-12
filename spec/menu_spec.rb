require 'menu'

describe Menu do

  it { is_expected.to be_an_instance_of(Menu) }

  it { is_expected.to respond_to :show }

  it 'should print a list of dishes to the screen' do
    expect(subject.show).to eq('pie deluxe - 9.99 \n pie supreme - 8.50 \n pie galore - 5.60 \n just a pie - 5.10')
  end

end
