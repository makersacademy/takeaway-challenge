require 'user'

describe User do

  it 'runs the method for printing and creating the menu when initialized' do
    output = "1.Plastic fried virus skin: $9.99\n2.Birdpeople egg with dehydrated watermelon: $88.67\n3.Shredded concreate: $4.99\n4.Cockroach-wing encapsulated microchip: $7.97\n5.Extra powdered rocket: $2.99\n6.Ninja squirrel rolled in plastic-bag: $4.67\n"
    expect { subject.menu }.to output(output).to_stdout
  end

  it 'creates an empty array for the basket' do
    expect(subject.basket).to be_instance_of(Array)
  end
  #
  # end
  # it 'the user can make a selection through stdin' do
  #   expect(subject.user_selection).to eq gets.chomp
  # end
  #
  # it 'adds this selection to a basket' do
  #
  # end
  #
  # it 'the user can make several selections through stdin' do
  #
  # end
  #
  # it 'saves the users selection to a file' do
  # end

end
