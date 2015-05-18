class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  before_save { self.email = email.downcase }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
