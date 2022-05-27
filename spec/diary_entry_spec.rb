require 'diary_entry'

RSpec.describe DiaryEntry do
  it "Stores title and contents" do
    entry = DiaryEntry.new("Monday", "My entry for Monday")
    entry.title = "Monday"
    entry.contents = "My entry for Monday"
  end
  it "Calculates its reading time based on reading speed in wpm for exact number of words" do
    entry = DiaryEntry.new("Monday", "My details about Monday")
    expect(entry.reading_time(2)).to eq 2
  end
  it "Calculates its reading time based on reading speed in wpm when rounding up" do
    entry = DiaryEntry.new("Tuesday", "My details about Tuesday too")
    expect(entry.reading_time(2)).to eq 3
  end
end
