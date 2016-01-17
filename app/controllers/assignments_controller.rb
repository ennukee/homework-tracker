class AssignmentsController < ApplicationController
  include ApplicationHelper
	def new
		@assignment = Assignment.new
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def index
		@assignments = Assignment.order(sort_column + " " + sort_direction)
	end

	def edit
		@assignment = Assignment.find(params[:id])
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
		@assignment = Assignment.new(assn_params)

		if @assignment.save
      flash_add(:success, "Assignment " + @assignment.name + " created!")
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		@assignment.destroy

		redirect_to assignments_path
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

		def sort_column
   			Assignment.column_names.include?(params[:sort]) ? params[:sort] : "name"
  		end
  
  		def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  		end
end
