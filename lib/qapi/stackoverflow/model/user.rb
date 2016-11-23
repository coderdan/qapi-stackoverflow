module Qapi::Stackoverflow
  class User < Qapi::Model
    attribute :user_id
    attribute :location
    attribute :display_name
    attribute :about_me
    attribute :profile_image
    attribute :website_url
    attribute :reputation
    attribute :link # On stack overflow
    
    def tags
      TagQuery.new(@connection).for_user(user_id)
    end
  end
end
