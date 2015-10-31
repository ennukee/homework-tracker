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

	def date_format(i)
		to_add = ""
		case ((i - Time.now.to_date).to_i)
		when 0
			to_add = "due today"
		when -30..0
			to_add = "past due"
		when 30..365
			to_add = "in ~" + ((i - Time.now.to_date).to_i/30).to_s + " months"
		when 365..10000
			to_add = "in over a year"
		else
			to_add = "in " + (i - Time.now.to_date).to_i.to_s + " days"
		end
		i.strftime("%m/%d/%Y") + "\n(" + to_add + ")"
	end
end
