require 'diary_entry'
require 'diary'
require 'task'
require 'todo_list'
require 'contacts_list'

RSpec.describe "integration" do
  it "adds an entry to a new diary" do
    entry = DiaryEntry.new("Monday", "My details about Monday")
    diary = Diary.new
    diary.add(entry)
    expect(diary.read(entry)).to eq "My details about Monday"      
  end
  it "adds an entry to a non-empty diary" do
    entry1 = DiaryEntry.new("Monday", "My details about Monday")
    diary = Diary.new
    diary.add(entry1)
    entry2 = DiaryEntry.new("Tuesday", "My details about Tuesday")
    diary.add(entry2)
    expect(diary.read(entry2)).to eq "My details about Tuesday"
  end
  it "recommends a time-based read" do
    entry1 = DiaryEntry.new("Monday", "My details about Monday")
    diary = Diary.new
    diary.add(entry1)
    entry2 = DiaryEntry.new("Tuesday", "My details all about Tuesday")
    diary.add(entry2)
    # case where no entries are suitable
    expect(diary.read_time_based(1,1)).to eq ""
    # best-fit using all of available time and words
    expect(diary.read_time_based(4,1)).to eq "My details about Monday"
    # best-fit with some time and words to spare when more than one possibility
    expect(diary.read_time_based(6,1)).to eq "My details all about Tuesday"
  end
  it "adds task to an empty todo-list and non-empty todo-list" do
    task1 = Task.new("First task")
    list = TodoList.new 
    list.add(task1)
    list.list_all => [task1]
    task2 = Task.new("Second task")
    list.add(task1)
    list.list_all => [task1, task2]
  end
  it "extracts contacts from diary entries into contact list" do
    diary = Diary.new
    contacts = ContactsList.new
    expect(contacts.list_all).to eq []
    entry0 = DiaryEntry.new("Sunday", "I rested")
    contacts.add(entry0.extract_contacts)
    expect(contacts.list_all).to eq []
    entry1 = DiaryEntry.new("Monday", "I phoned 07111222333")
    contacts.add(entry1.extract_contacts)
    expect(contacts.list_all).to eq ["07111222333"]
    entry2 = DiaryEntry.new("Tuesday", "I phoned 07222333444")
    contacts.add(entry2.extract_contacts)
    expect(contacts.list_all).to eq ["07111222333","07222333444"]
    # For below example need to return all occurrences of a given regex within a string
    # I will attempt that another day now, I think!
    # entry3 = "DiaryEntry.new("Wednesday", "Today I phoned 07555666777 and 07888999000")
    # contacts.add(entry3.extract_contacts)
    # entry3 = DiaryEntry.new("Wednesday", "Today I phoned 07555666777 and 07888999000")
    # contacts.add(entry3.extract_contacts)
    # expect(contacts.list_all).to eq ["07111222333","07222333444", "07555666777", "07888999000"]
    entry4 = DiaryEntry.new("Thursday", "I phoned 07222333444 again")
    contacts.add(entry4.extract_contacts)
    expect(contacts.list_all).to eq ["07111222333","07222333444"]
  end  
end
