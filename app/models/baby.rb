class Baby < ActiveRecord::Base
    belongs_to :user
    has_many :events, through: :user
end
