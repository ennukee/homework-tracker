class AssignmentsController < ApplicationController
	def new
		@assignment = Assignment.new
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def index
		@assignments = Assignment.order(params[:sort] || :name)
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
			redirect_to @assignment
		else
			render 'new'
		end
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		@assignment.destroy

		redirect_to assignments_path
	end

	private
		def assn_params
			params.require(:assignment).permit(:name, :due_date, :assn_type, :percent_done)
		end
end
