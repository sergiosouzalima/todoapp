module TasksHelper
  def is_edition_allowed?(task)
    (current_user.id == task.user_id || task.public == 'public')
  end
end
