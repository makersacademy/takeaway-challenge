class Note
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

class NoteBook
  def initialize(note_class = Note)
    @note_class = note_class
    @notes = []
  end

  def create(text)
    @note_class.new(text)
  end

  def store(note)
    @notes << note
  end

  def all
    # @notes.map do |note|
    #   note.text
    # end.join("\n")
    @notes.map(&:text).join("\n")
  end
end


require 'note_book'
# require 'note'

# class MockNote
#   def text
#     "hello"
#   end
# end

RSpec.describe NoteBook do
  xit 'returns a string of all notes' do
    # setup
    notebook = NoteBook.new

    note1 = double('note1', :text => "hello")
    note2 = double('note2', text: "hello")

    notebook.store(note1)
    notebook.store(note2)

    # execute, verify
    expect(notebook.all).to eq "hello\nhello"
    # tear down (happens automatically with rspec)
  end

  it 'can create a note' do
    # setup
    mock_instance = double()
    mock_note = double(new: mock_instance)
    notebook = NoteBook.new(mock_note)

    binding.pry
    #execute, verify
    # expect(mock_note).to receive(new:).with('banana').and_return(mock_instance)
    expect(notebook.create('banana')).to eq mock_instance

  end
