module ApplicationHelper
  def is_edition_allowed?(task_user_id, current_user_id)
    (current_user_id == task_user_id)
  end
end
