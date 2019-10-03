class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :created_at
end
