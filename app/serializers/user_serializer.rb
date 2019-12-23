class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :display_name
end
