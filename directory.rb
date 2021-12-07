# Put students into an array
students = [
  ['Dr. hannibal Lecter', :november],
  ['Darth Vader', :november],
  ['Nurse Ratched', :november],
  ['Michael Coreleone', :november],
  ['Alex DeLarge', :november],
  ['The Wicked Witch of the West', :november],
  ['Terminator', :november],
  ['Freddy Krueger', :november],
  ['The Joker', :november],
  ['Joffrey Baratheon', :november],
  ['Norman Bates', :november]
]

def print_header
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def print(students)
  students.each {|student| puts "#{student[0]} (#{student[1]} cohort)"}
end  

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Method calls
print_header()
print(students)
print_footer(students)