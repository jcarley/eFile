class User
  include Mongoid::Document

  rolify

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :nickname, type: String
  field :image, type: String
  field :description, type: String
  field :token, type: String
  field :expires_at, type: String



  def self.from_omniauth(auth)
    u = where("provider" => auth["provider"], "uid" => auth["uid"]).first_or_initialize.tap do |user|
      user.provider         = auth["provider"]
      user.uid              = auth["uid"]
      user.name             = auth["info"]["name"]              if auth["info"]["name"]
      user.email            = auth["info"]["email"]             if auth["info"]["email"]
      user.nickname         = auth["info"]["nickname"]          if auth["info"]["nickname"]
      user.image            = auth["info"]["image"]             if auth["info"]["image"]
      user.description      = auth["info"]["description"]       if auth["info"]["description"]
      user.token            = auth["credentials"]["token"]      if auth["credentials"]["token"]
      user.expires_at       = auth["credentials"]["expires_at"] if auth["credentials"]["expires_at"]
    end
    u if u.save
  end

end
