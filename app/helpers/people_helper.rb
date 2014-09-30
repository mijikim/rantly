module PeopleHelper

  def full_name(person)
    [person.first_name, person.last_name].join(" ").titleize
  end

end