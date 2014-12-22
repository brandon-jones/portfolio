json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :link, :details, :tags
  json.url project_url(project, format: :json)
end
