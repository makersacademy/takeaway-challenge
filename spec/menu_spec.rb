require 'menu'
describe Menu do
  #I think this is messing with the rspec and making me put input instead of simulating it... need to work on stub, doubles, whatever...
  #also even if you edit this out it still isn't happy... need to do something more in the order spec... maybe in the main body and not just
  #the tests... like right after the describe...
  let(:gets) { "complete order" }
  it 'is an instance of menu' do
    subject.stub(:gets) {"complete order"}
    expect(subject).to be_instance_of(Menu)

  end
end
