
module Fauna
  class User < Fauna::Model

    validates :name, :presence => true

    def self.find_by_email(email)
      find_by("users", :email => email)
    end

    def self.find_by_external_id(external_id)
      find_by("users", :external_id => external_id)
    end

    def self.find_by_name(name)
      find_by("users", :name => name)
    end

    def email; struct['email']; end

    def password; struct['password']; end

    # FIXME https://github.com/fauna/issues/issues/16
    def name
      struct['name']
    end

    private

    def post
      Fauna::Client.post("users", struct)
    end
  end
end
