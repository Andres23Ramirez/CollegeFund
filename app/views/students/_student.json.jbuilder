json.extract! student, :id, :birthdate, :username, :goal, :parent_id, :created_at, :updated_at
json.url student_url(student, format: :json)