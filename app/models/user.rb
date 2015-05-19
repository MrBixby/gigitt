class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :profile
  has_and_belongs_to_many :venues
  has_and_belongs_to_many :bands

  def role_options
    [["Venue Manager", "venue"], ["Fan", "fan"], ["Musician", "musician"]]
  end



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :username, presence: true,
                    uniqueness: true,
                    format: {
                      with: /[a-zA-Z0-9-]+/,
                      message: 'Must be formated correctly.'
                    }

end
