require './lib/menu.rb'

describe Menu do

  it "lists the menu" do
  expect { subject.list }
  .to output(
"STARTERS
Onion Bhaji - £2.95
Samosa - £2.95
MAINS
Duck Tikka - £8.95
Lamb Balti - £6.95
SIDES
Sag Aloo - £2.95
Special Fried Rice - £2.95
"
).to_stdout
  end
end
