class Task < ActiveRecord::Base
  belongs_to :user
  has_many :sub_tasks

  validates :name, :presence =>true, :uniqueness => {:scope => :user_id}
  validates_presence_of :public
  validates_inclusion_of :public, in: ["public", "private"]

end

