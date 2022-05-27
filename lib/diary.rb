class Diary

  attr_reader :entries

  def initialize
    @entries = []
  end

  def read(entry)
    # entry is a DiaryEntry
    entry.contents
  end

  def add(entry)
    # entry is a DiaryEntry
    @entries << entry
  end

  def read_time_based(wpm, min)
    # wpm and min are integers
    # returns longest entry based on reading time allowed at given speed

    # sort entries by word-count in decreasing order of length
    # go through from start, take first recording whose read-time
    # is within number of minutes allowed
    entries_by_wordcount = @entries.sort { |e1,e2| e2.contents.split(" ").length <=> e1.contents.split(" ").length }
    entries_by_wordcount.each do |e|
      return e.contents if e.contents.split(" ").length <= wpm * min
    end
    return "" 
  end

end

