class AssignmentsController < ApplicationController
  include ApplicationHelper
	def new
		@assignment = Assignment.new
	end

	def show
		@assignment = Assignment.find(params[:id])
		redirect_to assignments_path(view_asn: "true")
	end

	def index
		@assignments = Assignment.order(sort_column + " " + sort_direction)
		@s_column = sort_column
		@s_direction = sort_direction
	end

	def edit
		@assignment = Assignment.find(params[:id])
		if current_user.id != @assignment.user.id
			flash_add(:danger, "That assignment doesn't belong to you!")
			redirect_to root_path 
		end
	end

	def update
		@assignment = Assignment.find(params[:id])
		if @assignment.update(assn_params)
			redirect_to @assignment
		else
			render 'edit'
		end
	end

	def create
		if params[:is_repeating]
			(0..params.require(:repeat_count).to_i).each do |i| 
				@assignment = Assignment.new(assn_params)
				case params.require(:repeat_amount)
				when 'Day(s)'
					@assignment.due_date += i.days
				when 'Week(s)'
					@assignment.due_date += i.weeks
				when 'Month(s)'
					@assignment.due_date += i.months
				when 'Year(s)'
					@assignment.due_date += i.years
				end
				unless @assignment.save
					flash_add(:danger, "Something wrong in the making of #{@assignment.name} #{i}")
					render 'new'
				end
			end
			flash_add(:success, "Mass assignment creation successful!")
			redirect_to root_path
		else
			@assignment = Assignment.new(assn_params)
			if @assignment.save
	      		flash_add(:success, "Assignment " + @assignment.name + " created!")
				redirect_to root_path
			else
				render 'new'
			end
		end
		
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		if current_user.id != @assignment.user.id
			flash_add(:danger, "That assignment doesn't belong to you!")
			redirect_to root_path and return
		end
		@assignment.destroy
		redirect_to assignments_path
	end

	def toggle_importance
		@assignment = Assignment.find(params[:id])
		if @assignment.important
			@assignment.update_attributes(important: false)
		else
			@assignment.update_attributes(important: true)
		end
		redirect_to(:back)
	end

  def carousel_toggle
    if session[:carousel]
    	session[:carousel] = false
    else session[:carousel] = true
    end
    redirect_to(:back)
  end

	private
		helper_method :sort_column, :sort_direction
		def assn_params
			params.require(:assignment).permit(:name, :due_date, :assn_type, :percent_done, :user_id)
		end

		def mass_assn_params
			params.require(:assignment).permit(:name, :assn_type, :percent_done, :user_id)
		end

		def sort_column
   			Assignment.column_names.include?(params[:sort]) ? params[:sort] : "due_date"
  		end
  
  		def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  		end
end
