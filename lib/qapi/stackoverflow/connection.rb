module Qapi
  module Stackoverflow
    class Connection < Qapi::Connection
      self.site = "https://api.stackexchange.com"

      def users
        Qapi::Stackoverflow::UserQuery.new(self)
      end
    end
  end
end
