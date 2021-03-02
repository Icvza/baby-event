class Event < ActiveRecord::Base
    belongs_to :baby 
    belongs_to :user
    validates :content, presence: true
    validates :time, presence: true
end
