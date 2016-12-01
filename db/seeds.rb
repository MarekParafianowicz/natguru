puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')


teachers_arr = [
  { first_name: "Albus", last_name: "Dumbledore", academic_title: "Prof." },
  { first_name: "Severus", last_name: "Snape", academic_title: TEACHER_TITLES.sample },
  { first_name: "Rubeus", last_name: "Hagrid", academic_title: TEACHER_TITLES.sample }
]
teachers_arr.each do |teacher|
  Teacher.create!(teacher)
end

teachers = Teacher.all
subjects_arr = [
  { title: "Care of Magical Creatures" , teacher: teachers.sample },
  { title: "Potions" , teacher: teachers.sample },
  { title: "Transfiguration" , teacher: teachers.sample },
  { title: "Muggle Studies", teacher: teachers.sample },
  { title: "Dark Arts" , teacher: teachers.sample }
]
subjects_arr.each do |subject|
  SubjectItem.create!(subject)
end

students_arr = [
  { first_name: "Harry" , last_name: "Potter" },
  { first_name: "Hermione" , last_name: "Granger" },
  { first_name: "Ron" , last_name: "Weasley" },
  { first_name: "Neville" , last_name: "Longbottom" },
  { first_name: "Dean" , last_name: "Thomas" },
  { first_name: "Seamus" , last_name: "Finnigan" },
  { first_name: "Lavender" , last_name: "Brown" },
  { first_name: "Draco" , last_name: "Malfoy" },
  { first_name: "Vincent" , last_name: "Crabbe" },
  { first_name: "Gregory" , last_name: "Goyle" },
  { first_name: "Theodore" , last_name: "Nott" },
  { first_name: "Blaise" , last_name: "Zabini" },
  { first_name: "Pansy" , last_name: "Parkinson" },
  { first_name: "Daphne" , last_name: "Greengrass" },
  { first_name: "Millicent" , last_name: "Bullstrode" },
  { first_name: "Tracey" , last_name: "Davis" },
  { first_name: "Morag" , last_name: "Macdougal" },
  { first_name: "Lisa" , last_name: "Turpin" },
  { first_name: "Su" , last_name: "Li" },
  { first_name: "Anthony" , last_name: "Goldstein" },
  { first_name: "Michael" , last_name: "Corner" },
  { first_name: "Megan" , last_name: "Jones" },
  { first_name: "Susan" , last_name: "Bones" },
  { first_name: "Hannah" , last_name: "Abbott" },
  { first_name: "Wayne" , last_name: "Hopkins" }
]
students_arr.each do |student|
  Student.create!(student)
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(5..14))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
