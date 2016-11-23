
module Qapi::Stackoverflow
  class TagQuery < Qapi::Query
    def for_user(user_id)
      response = @connection.get("/2.2/users/#{user_id}/tags", site: 'stackoverflow', key: ENV['STACK_OAUTH_KEY'])
      # TODO: Check if an item was found
      Tag.parse(@connection, JSON(response.body)['items'])
    end
  end
end
