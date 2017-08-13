require 'app'

describe App do
  let(:io_obj) { double() }
  let(:sms) { double() }
  subject { App.new(sms) }
  describe '.order' do
    context 'initializes with new order' do
      specify {
        expect(subject.order).not_to be(nil)
      }
    end

    context 'with type of Order' do
      specify {
        expect(subject.order).to be_a(Order)
      }
    end
  end

  describe '.run' do
    before do
      allow(subject).to receive(:loop).and_yield
      allow(subject).to receive(:gets).and_return(io_obj)
      allow(io_obj).to receive(:chomp).and_return("0")
    end

    context 'method call' do
      specify {
        expect(subject).to respond_to(:run)
      }
    end

    context 'message' do
      specify {
        expect { subject.run }.to output.to_stdout
      }
    end

    context 'loop' do
      specify {
        expect(subject).to receive(:loop).and_yield
        subject.run
      }
    end

    context 'process input' do
      specify {
        expect(subject).to receive(:process_input)
        subject.run
      }
    end

    context 'gets' do
      specify {
        expect(subject).to receive(:gets).and_return(io_obj)
        subject.run
      }
    end
  end

  describe '.new_order' do
    context 'is an order' do
      specify {
        expect(subject.send(:new_order)).to be_a(Order)
      }
    end
  end

  describe '.process_input' do
    before do
      allow(subject).to receive(:command).and_yield
      allow(subject).to receive(:exit)
      allow(subject).to receive(:system)
    end
    context 'commands' do
      specify {
        expect(subject).to receive(:command).and_yield
        subject.send(:process_input, "")
      }
    end

    context 'quits' do
      specify {
        expect(subject).to receive(:quit)
        subject.send(:process_input, "q")
      }
    end

    context 'shows menu' do
      specify {
        expect { subject.send(:process_input, "m") }.to output.to_stdout
      }
    end

    context 'shows basket' do
      specify {
        expect { subject.send(:process_input, "b") }.to output.to_stdout
      }
    end

    context 'complete order' do
      specify {
        expect(subject).to receive(:complete)
        subject.send(:process_input, "c")
      }
    end

    context 'select dish' do
      specify {
        expect(subject).to receive(:try_select_dish)
        subject.send(:process_input, "0")
      }
    end
  end

  describe '.command' do
    context 'clear' do
      specify {
        expect(subject).to receive(:system)
        subject.send(:command) {}
      }
    end

    context 'yield' do
      specify {
        expect(subject).to receive(:command).and_yield
        subject.send(:command) {}
      }
    end
  end

  describe '.try_select_dish' do
    context 'valid dishes' do
      specify {
        expect { subject.send(:try_select_dish, '0') }.to output("selected dish: spam\n").to_stdout
      }
    end

    context 'invalid dishes' do
      specify {
        expect { subject.send(:try_select_dish, '9001') }.to output("9001 is not a valid dish id\n").to_stdout
      }
    end
  end

  describe '.complete' do
    before do
      allow(sms).to receive(:send)
      allow(subject).to receive(:gets).and_return(io_obj)
      allow(io_obj).to receive(:chomp).and_return("0")
    end

    context 'output' do
      specify {
        expect { subject.send(:complete) }.to output.to_stdout
      }
    end

    context 'new order' do
      specify {
        expect(sms).to receive(:send)
        subject.send(:complete)
      }
    end

    context 'new order' do
      specify {
        expect(subject).to receive(:new_order)
        subject.send(:complete)
      }
    end
  end

  describe '.phone_number' do
    before do
      allow(subject).to receive(:gets).and_return(io_obj)
      allow(io_obj).to receive(:chomp).and_return("0")
    end

    context 'gets' do
      context 'gets' do
        specify {
          expect(subject).to receive(:gets).and_return(io_obj)
          subject.send(:phone_number)
        }
      end
    end
  end

  describe '.quit' do
    context 'output' do
      specify {
        allow(subject).to receive(:exit)
        expect { subject.send(:quit) }.to output.to_stdout
      }
    end
    context 'exit' do
      specify {
        expect(subject).to receive(:exit)
        subject.send(:quit)
      }
    end
  end
end
