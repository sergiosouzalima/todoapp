class SubTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  validates :name, :presence =>true
end
