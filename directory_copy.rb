def print_header
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty?
    students.push({name: name, cohort: :november}) 
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  return students
end

def print(students)

  count = 0
  while count < students.length
    name = students[count][:name]
    cohort = students[count][:cohort]

    puts "#{count + 1}: #{name} (#{cohort} cohort)"
    count += 1
  end
end  

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Method calls
students = input_students()
print_header()
print(students)
print_footer(students)