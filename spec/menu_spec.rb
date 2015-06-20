require 'menu'

describe Menu do

  it { is_expected.to respond_to(:menu)}

  it { is_expected.to respond_to(:show)}

  # describe 'show' do
  #   it 'displays the list of food and prices' do
      
  #     expect(subject.show).to eq(:menu)
  #   end
  # end

end