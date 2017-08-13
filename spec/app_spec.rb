require 'app'

describe App do
  let(:io_obj) { double(:io_o) }
  let(:sms) { double(:sms) }
  let(:formatter) { double(:formatter) }
  let(:menu) { double(:menu) }

  let(:basket) { double(:basket) }
  let(:basket_klass) { double(:basket_klass, new: basket) }

  let(:order) { double(:order) }
  let(:order_klass) { double(:order_klass, new: order) }

  subject { App.new(sms, menu, basket_klass, order_klass, formatter) }

  before do

    allow(order).to receive_messages(
      select_dish: true,
      complete: nil,
      show: ""
    )

    allow(formatter).to receive_messages(
      format_table: "",
      format_price: ""
    )

    allow(menu).to receive_messages(
      item_count: 5,
      get_dish: { name: "something", price: 1 },
      show: ""
    )

    allow(subject).to receive(:loop).and_yield
    allow(subject).to receive(:gets).and_return(io_obj)
    allow(subject).to receive_messages(
      exit: nil,
      system: nil
    )

    allow(sms).to receive(:send)

    allow(io_obj).to receive(:chomp).and_return("0")
  end

  describe '.order' do
    context 'not nil' do
      specify {
        expect(subject.order).not_to eq(nil)
      }
    end
  end

  describe '.run' do
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
    context 'creates' do
      specify {
        expect(order_klass).to receive(:new)
        subject.send(:new_order)
      }
    end
    context 'order' do
      specify {
        expect(subject.send(:new_order)).to eq(order)
      }
    end
  end

  describe '.process_input' do
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

    context 'shows menu' do
      specify {
        expect(menu).to receive(:show)
        subject.send(:process_input, "m")
      }
    end

    context 'calls menu' do
      specify {
        expect(menu).to receive(:show)
        subject.send(:process_input, "m")
      }
    end

    context 'shows basket' do
      specify {
        expect { subject.send(:process_input, "b") }.to output.to_stdout
      }
    end

    context 'shows basket' do
      specify {
        expect(order).to receive(:show)
        subject.send(:process_input, "b")
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

    context 'select dish' do
      specify {
        expect(order).to receive(:select_dish)
        subject.send(:try_select_dish, "0")
      }
    end

    context 'get dish' do
      specify {
        expect(menu).to receive(:get_dish)
        subject.send(:try_select_dish, "0")
      }
    end

    context 'valid dishes' do
      specify {
        expect(menu).to receive(:get_dish)
        subject.send(:try_select_dish, '0')
      }
    end

    context 'invalid dishes' do
      specify {
        allow(order).to receive(:select_dish).and_return(false)
        expect { subject.send(:try_select_dish, '9001') }.to output("9001 is not a valid dish id\n").to_stdout
      }
    end
  end

  describe '.complete' do

    context 'output' do
      specify {
        expect { subject.send(:complete) }.to output.to_stdout
      }
    end

    context 'complete' do
      specify {
        expect(order).to receive(:complete)
        subject.send(:complete)
      }
    end

    context 'new order' do
      specify {
        expect(sms).to receive(:send)
        subject.send(:complete)
      }
    end

    context 'quit' do
      specify {
        expect(subject).to receive(:quit)
        subject.send(:complete)
      }
    end
  end

  describe '.phone_number' do
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
