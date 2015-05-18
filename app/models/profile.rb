class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
     "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end
