module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include Devise::Controllers::Helpers

    identified_by :current_admin

    def connect
      if admin_signed_in?
        self.current_admin = current_admin
        logger.add_tags 'ActionCable', current_admin.email
      end
    end
  end
end
