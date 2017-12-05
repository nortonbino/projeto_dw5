module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include Devise::Controllers::Helpers

    identified_by :current_user

    def connect
      if resident_signed_in?
        self.current_user = current_resident
        logger.add_tags 'ActionCable', current_user.email
      end
    end
  end
end
