class Album < ActiveRecord::Base

    belongs_to :band
    has_many :songs, dependent: destroy
    accepts_nested_attributes_for :songs, allow_destroy: true
end
