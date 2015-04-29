class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  before_create :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end

  before_create :capitalize_names
  def capitalize_names
    self.profile = profile.camelcase
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :profile, presence: true,
                    uniqueness: true,
                    format: {
                      with: /[a-zA-Z0-9-]+/,
                      message: 'Must be formated correctly.'
                    }

  has_many :gigs

end
