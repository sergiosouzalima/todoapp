class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :name
      t.belongs_to :task, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
