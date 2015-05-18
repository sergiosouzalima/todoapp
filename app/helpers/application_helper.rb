module ApplicationHelper
  def is_edition_allowed?(task_user_id, task_public, current_user_id)
    (current_user_id == task_user_id || task_public == 'public')
  end
end
