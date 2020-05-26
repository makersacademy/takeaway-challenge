require 'order_process'

describe OrderProcess do
  it 'should instantiate a new instance' do
    expect(OrderProcess).to respond_to(:new)
  end


context ' #show_menu' do
  let(:expected_output) { ["Costa del Oval Menu",
                             "1. Veggie Burger and Sweet Potato Fries: £3",
                             "2. Veggie Lasagna: £5",   
                             "3. Falafel and Hallumi Wrap: £4"].join("\n") + "\n" 
    }

  it 'shows entire menu list' do
    expect { subject.show_menu }.to output(expected_output).to_stdout
    end
  end
end