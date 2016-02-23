class SiteText < ActiveRecord::Base
	validates_presence_of :title
	validates_presence_of :content

	scope :changelog, -> { find_by(title: "Changelog") }
	scope :important, -> { where(important: true) }
end
