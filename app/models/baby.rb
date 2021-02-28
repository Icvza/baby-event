class Baby < ActiveRecord::Base
    belongs_to :user
    has_many :events, through: :user

    validates :name, presence: true
    validates :DOB, presence: true
end
