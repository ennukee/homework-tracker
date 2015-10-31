module AssignmentsHelper
	def percent_format(i)
		i.to_s + "%"
	end

	def assn_type_format(i)
		case i
		when 1
			"Extra Credit"
		when 2
			"Homework"
		when 3
			"Major Homework"
		when 4
			"Project"
		when 5
			"Exam"
		else
			"Invalid Type"
		end
	end
end
