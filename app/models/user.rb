class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         enum role: [:admin, :vip, :user]
         after_initialize :default_role

  def default_role
    self.role ||= :user
  end
end
