class AssignmentsController < ApplicationController
	def new
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def index
	end

	def create
		@assignment = Assignment.new(params.require(:assignment).permit(:name, :due_date, :assn_type, :percent_done))

		@assignment.save
		redirect_to @assignment
	end
end
