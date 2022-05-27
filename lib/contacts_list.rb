class ContactsList

  def initialize
    # start with empty list
    @list = []
  end

  def add(contact)
    # contact is a String
    @list << contact unless contact.nil? || @list.include?(contact)
  end

  def list_all
    @list
  end

end
