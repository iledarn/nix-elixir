defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name)
    |> String.at(0)
  end

  def initial(name) do
    first_letter(name)
    |> String.capitalize()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    first_letter_first_name = initial(first_name)
    first_letter_last_name = initial(last_name)
    "#{first_letter_first_name} #{first_letter_last_name}"
  end

  def pair(full_name1, full_name2) do
"""
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     #{initials(full_name1)}  +  #{initials(full_name2)}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"""
  end
end
