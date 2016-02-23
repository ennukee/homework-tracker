class SiteTextController < ApplicationController
	include ApplicationHelper
	def new
		redirect_to root_path and return if current_user.privilege <= 5
		@sitetext = SiteText.new
	end

	def create
		redirect_to root_path and return if current_user.privilege <= 5
		@sitetext = SiteText.new(assn_params)
		if @sitetext.save
			flash_add(:success, "Site text " + @sitetext.title + " created!")
			redirect_to root_path
		else
			flash_add(:success, "Could not create site text " + @sitetext.title)
			render 'new'
		end
	end

	def edit
		redirect_to root_path and return if current_user.privilege <= 5
		@sitetext = SiteText.find_by_id(params[:id])
		unless @sitetext
			flash_add(:warning, "A site text with that ID does not exist")
			redirect_to root_path
		end
	end

	def update
		redirect_to root_path and return if current_user.privilege <= 5
		@sitetext = SiteText.find_by_id(params[:id])
		if @sitetext.update(assn_params)
			flash_add(:success, "Site text '" + @sitetext.title + "' updated!")
			redirect_to root_path
		else
			flash_add(:warning, "Something went wrong saving the site text")
			redirect_to root_path
		end
	end

	def destroy
		redirect_to root_path and return if current_user.privilege <= 5
		@sitetext = SiteText.find_by_id(params[:id])
		if @sitetext
			@sitetext.destroy
		end
		redirect_to root_path
	end

	def generate_changelog
		redirect_to root_path and return if current_user.privilege <= 5
		unless SiteText.find_by(title: 'Changelog')
			SiteText.create(title: 'Changelog', content: "#Changelog", markdown: true)
		end
		redirect_to :back
	end

	private
    def assn_params
      params.require(:site_text).permit(:title, :content, :important, :markdown)
    end
end
