require 'menu'

describe Menu do

  dishes =
"1 Chicpeas Jungle       £12,95
2 Brocoli Bush          £9,95
3 Aspargus Forest       £11,95
4 Lentils Peak          £8,95
5 Banana Curnicopia     £6,95
"

  it 'respond to the method display' do
    expect(subject).to respond_to(:display)
  end

  it 'should return the dishes' do
    expect { subject.display }.to output(dishes).to_stdout

  end
end
