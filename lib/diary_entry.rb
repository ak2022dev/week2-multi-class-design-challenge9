class DiaryEntry
  attr_accessor :title, :contents
  
  def initialize(title, contents)
    # title and contents are Strings
    @title = title
    @contents = contents
  end

  def extract_contacts
    # goes through contents and returns
    # list of phone numbers from contents
    number = contents[/\d{11}/]
    return number
  end

  def reading_time(wpm)
    # wpm is an integer
    return (contents.split(" ").length / wpm.to_f).ceil
  end
end
