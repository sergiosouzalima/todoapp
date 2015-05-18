json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :public
  json.url task_url(task, format: :json)
end
