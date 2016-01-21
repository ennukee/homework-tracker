class Assignment < ActiveRecord::Base
  belongs_to :user
  default_scope { order('due_date ASC') }

  validates :name, presence: true, length: {minimum: 3}
	validates_numericality_of :percent_done
	validates :assn_type, presence: true
	validates :percent_done, presence: true

end
