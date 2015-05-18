# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "\n\n...... \n"
puts "Alimentando banco de dados...\n\n"
User.delete_all

user = CreateAdminService.new.call
task = Task.find_or_create_by!(name: 'Task #001', public: 'public', user: user) do |task|
  sub_task = SubTask.find_or_create_by!(name: 'Sub task #001 under Task #001', task: task, user: user) do |sub_task|
    sub_task.save!
  end
  sub_task = SubTask.find_or_create_by!(name: 'Sub task #002 under Task #001', task: task, user: user) do |sub_task|
    sub_task.save!
  end
end
Task.find_or_create_by!(name: 'Task #002', public: 'private', user: user)
Task.find_or_create_by!(name: 'Task #003', public: 'public', user: user)
puts "Usuario administrador #{user.name} criado com o nome de usuario: " << user.email
puts ""

user = User.find_or_create_by!(email: Rails.application.secrets.avenuecode_email) do |user|
  user.password = Rails.application.secrets.avenuecode_password
  user.password_confirmation = Rails.application.secrets.avenuecode_password
  user.name = Rails.application.secrets.avenuecode_name
  user.role = 0
  user.save!
  #
  task = Task.find_or_create_by!(name: 'Task #001', public: 'public', user: user) do |task|
    sub_task = SubTask.find_or_create_by!(name: 'Sub task #001 under Task #001', task: task, user: user) do |sub_task|
      sub_task.save!
    end
    sub_task = SubTask.find_or_create_by!(name: 'Sub task #002 under Task #001', task: task, user: user) do |sub_task|
      sub_task.save!
    end
    sub_task = SubTask.find_or_create_by!(name: 'Sub task #003 under Task #001', task: task, user: user) do |sub_task|
      sub_task.save!
    end
  end
  Task.find_or_create_by!(name: 'Task #002', public: 'private', user: user)
  Task.find_or_create_by!(name: 'Task #003', public: 'public', user: user)
end
puts "Usuario #{user.name} da Avenue Code criado com o nome de usuario: " << user.email
puts ""

user = User.find_or_create_by!(email: 'john_doe@avenuecode.com') do |user|
  user.password = Rails.application.secrets.avenuecode_password
  user.password_confirmation = Rails.application.secrets.avenuecode_password
  user.name = "John Doe"
  user.role = 0
  user.save!
  #
  task = Task.find_or_create_by!(name: 'Task #001', public: 'public', user: user) do |task|
    sub_task = SubTask.find_or_create_by!(name: 'Sub task #001 under Task #001', task: task, user: user) do |sub_task|
      sub_task.save!
    end
  end
  Task.find_or_create_by!(name: 'Task #002', public: 'public', user: user)
  Task.find_or_create_by!(name: 'Task #003', public: 'public', user: user)
  Task.find_or_create_by!(name: 'Task #004', public: 'public', user: user)
  Task.find_or_create_by!(name: 'Task #005', public: 'private', user: user)
  Task.find_or_create_by!(name: 'Task #006', public: 'private', user: user)
end
puts "Usuario #{user.name} criado com o nome de usuario: " << user.email
puts ""

