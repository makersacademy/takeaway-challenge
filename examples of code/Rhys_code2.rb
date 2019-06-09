require_relative './textnote.rb'

class Notebook

  def initialize
    @notes = []
  end

  def save_text_note(note)
    @notes << note.note
  end

  def search_for_tag(tag)
    @notes.each do |note|
      puts note[:note] if note[:tag] == tag
    end
  end
end
