
module Qapi::Stackoverflow
  class UserQuery < Qapi::Query
    def me
      # TODO: We probably shouldn't read this key from the env
      response = @connection.get("/2.2/me", site: 'stackoverflow', key: ENV['STACK_OAUTH_KEY'])
      # TODO: Check if an item was found
      User.new(@connection, JSON(response.body)['items'][0])
    end

    def find(id)
      response = @connection.get("/2.2/users/#{id}", site: 'stackoverflow', key: ENV['STACK_OAUTH_KEY'])
      # TODO: Check if an item was found
      User.new(@connection, JSON(response.body)['items'][0])
    end
  end
end
