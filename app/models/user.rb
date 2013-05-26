class User
  include Mongoid::Document
  rolify
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
end
