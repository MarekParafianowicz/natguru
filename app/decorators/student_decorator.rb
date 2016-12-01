class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    student_id = self.id
  	notes = subject_item.subject_item_notes.where("student_id=#{student_id}")
  	if notes.count == 0
  		'0.00'
  	else
  		notes_sum = notes.inject(0) { |sum, note| sum + note.value }
  		notes_avg = notes_sum / notes.count.to_f
  		round_avg = '%.02f' % notes_avg
  	end
  end
end
