class Event < ActiveRecord::Base
    belongs_to :baby 
    belongs_to :user
end
