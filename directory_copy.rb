def print_header
  puts
  puts 'The students of Villains Academy'
  puts '--------------------------------'
end

def input_students
  students = []
  puts
  
  print 'Type quit if you are finished with adding students, else hit enter '
  while gets.chomp != 'quit'
    puts 'Please enter student information: '
    
    print 'name: '
    name = gets.chomp
    name = 'default' if name.empty?
    
    print 'cohort: '
    cohort = gets.chomp.to_sym
    cohort = 'default' if cohort.empty?
    
    print 'height: '
    height = gets.chomp
    height = 'default' if height.empty?
    
    print 'country of birth: '
    cob = gets.chomp
    cob = 'default' if cob.empty?

    students.push( {name: name, cohort: cohort, height: height, cob: cob} )
    puts "You have now #{students.length} student in the register"
    puts
    print 'Type quit if you are finished with adding students, else hit enter '
  end
  return students
end

def print_students(students)

  count = 0
  while count < students.length
    puts "#{count + 1}: #{students[count]}"
    count += 1
  end
end  

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
  puts
end

# Method calls
students = input_students()
print_header()
print_students(students)
print_footer(students)