{{PROBLEM}} Multi-Class Planned Design Recipe
1. Build a collaborating system for diary, todo and contacts management

    As a user
    So that I can record my experiences
    I want to keep a regular diary

    As a user
    So that I can reflect on my experiences
    I want to read my past diary entries

    As a user
    So that I can reflect on my experiences in my busy day
    I want to select diary entries to read based on how much time I have and my reading speed

    As a user
    So that I can keep track of my tasks
    I want to keep a todo list along with my diary

    As a user
    So that I can keep track of my contacts
    I want to see a list of all of the mobile phone numbers in all my diary entries



2. Design the Class System

See ./ClassDesign.dia (for use with the dia app)

class Task
  
  def initialize(title)
    #title is a String
  end

  def title
    # returns the title   
  end

end


class TodoList

  def initialize 
  end

  def add(task)
    #task is a Task
  end

  def list_all
  end

end


class Diary

  def initialize
    @entries = []
  end

  def read(entry)
    # entry is a DiaryEntry
  end

  def add(entry)
    # entry is a DiaryEntry
  end

  def read_time_based(wpm, min)
    # wpm and min are integers
    # returns longest entry based on reading time allowed at given speed
  end

end


class DiaryEntry

  def initialize(title, contents)
    # title and contents are Strings
  end

  def title 
    @title
  end

  def contents 
    @contents
  end

  def extract_contacts
    # goes through contents and returns
    # list of phone numbers from contents
  end

  def reading_time(wpm)
    # wpm is an integer
  end


class ContactsList

  def initialize
    # start with empty list 
  end

  def add(contacts)
    # contact is a String
  end

  def list_all
  end

end



3. Create Examples as Integration Tests


# Add an entry to a new diary
entry = DiaryEntry.new("Monday", "My details about Monday")
diary = Diary.new
diary.add(entry)
diary.read(entry) => "My details about Monday"

# Add an entry to a non-empty diary
entry1 = DiaryEntry.new("Monday", "My details about Monday")
diary = Diary.new
diary.add(entry1)
entry2 = DiaryEntry.new("Tuesday", "My details about Tuesday")
diary.add(entry2)
diary.read(entry2) => "My details about Tuesday"

# Read time-based
entry1 = DiaryEntry.new("Monday", "My details about Monday")
diary = Diary.new
diary.add(entry1)
entry2 = DiaryEntry.new("Tuesday", "My details all about Tuesday")
diary.add(entry2)
# case where no entries are suitable
diary.read_time_based(1,1) => []
# best-fit using all of available time and words
diary.read_time_based(4,1) => "My details about Monday"
# best-fit with some time and words to spare when more than one possibility
diary.read_time_based(6,1) = "My details all about Tuesday"

# 
task1 = Task.new("First task")
list = TodoList.new 
list.add(task1)
list.list_all => [task1]
task2 = Task.new("Second task")
list.add(task1)
list.list_all => [task1, task2]

# extracting contacts into contact list
diary = Diary.new
contacts = ContactList.new
contacts.listall => []
entry0 = DiaryEntry.new("Sunday", "I rested")
contacts.add(entry0.extract_contacts)
contact.list_all => []
entry1 = "DiaryEntry.new("Monday", "I phoned 07111222333")
contacts.add(entry1.extract_contacts)
contacts.list_all => ["07111222333"]
entry2 = "DiaryEntry.new("Tuesday", "I phoned 07222333444")
contacts.add(entry2.extract_contacts)
contacts.list_all => ["07111222333","07222333444"]
# For below example need to return all occurrences of a given regex within a string
# I will attempt that another day now, I think!
# entry3 = "DiaryEntry.new("Wednesday", "Today I phoned 07555666777 and 07888999000")
# contacts.add(entry3.extract_contacts)
contacts.list_all => ["07111222333","07222333444"]
entry4 = "DiaryEntry.new("Thursday", "I phoned 07222333444 again")
contacts.add(entry4.extract_contacts)
contacts.list_all => ["07111222333","07222333444"]


4. Create Examples as Unit Tests

# DiaryEntry class

# Remembers title and contents
entry = "DiaryEntry.new("Monday", "My entry for Monday")
entry.title = "Monday"
entry.contents = "My entry for Monday"

# Find reading time for an entry all words included
entry = DiaryEntry.new("Monday", "My details about Monday")
entry.reading_time(2) => 2

# Find reading time for an entry round up
entry = DiaryEntry.new("Tuesday", "My details about Tuesday too")
entry.reading_time(2) => 3

# Task class

# Remember the title of a task

task = Task.new("My todo")
task.title => "My todo"

# Diary class

diary = Diary.new
diary.entries => []

5. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.