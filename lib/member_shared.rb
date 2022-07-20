module MemberShared
  # Returns the full name as a string from the specified member
  # id in the Members table.
  def get_full_name(key)
    member = Member.find_by(id: key)
    return member.first_name + " " + member.last_name
  end
end
