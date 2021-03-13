require 'menu_printer'

describe MenuPrinter do
  describe '#print_divider_line' do
    it 'output a divider line' do
      STDOUT.should_receive(:puts).with('*****')
      subject.print_divider_line('*',5)
      # expect(subject.print_divider_line('*', 5)).to output('*****').to_stdout
    end
  end

  describe '#print_content_line' do
    it 'output a content line' do
      STDOUT.should_receive(:puts).with('this is a content line')
      subject.print_content_line('this is a content line')
    end
  end
end