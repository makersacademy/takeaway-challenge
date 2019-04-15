
class Notebook

  attr_reader :notes

  def initialize
    @notes = []
  end

  def store_entry
    @entry = {}
    @entry["#{@tag}"] = @note
    @notes << @entry
  end

  def add_note(note)
    @note = note
    puts "tag?"
    @tag = gets.chomp
    store_entry
  end

  def search_by_tag
    puts "enter tag:"
    search_tag = gets.chomp.to_s
    @notes.each do |a|
      a.each do |b,c|
        if search_tag == b
          puts c
        end
      end
    end
  end
end
