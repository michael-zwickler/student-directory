student_count = 11
# Put students into an array
students = [
  'Dr. hannibal Lecter',
  'Darth Vader',
  'Nurse Ratched',
  'Michael Coreleone',
  'Alex DeLarge',
  'The Wicked Witch of the West',
  'Terminator',
  'Freddy Krueger',
  'The Joker',
  'Joffrey Baratheon',
  'Norman Bates'
]

# print the students names
puts 'The students of Villains Academy'
puts '--------------------------------'
students.each {|name| puts name}
# Finally we print the total number of students
puts "Overall, we have #{student_count} great students"