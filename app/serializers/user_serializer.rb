class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :username, :created_at
end
