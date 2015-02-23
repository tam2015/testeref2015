class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable #:confirmable


  def self.find_for_oauth(auth, signed_in_resource = nil)
    provider = auth.provider

    Rails.logger.debug "\n ##{provider.capitalize}Response= #{auth.to_json} \n"

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?
      user = where(email: auth.info.email).first_or_initialize.tap do |user|
        user.email      = auth.info.email #|| "thiagoteste@hotmail.com"
        user.password   = Devise.friendly_token[0,20]
        #user.first_name = auth.info.first_name
        #user.last_name  = auth.info.last_name
        #user.meli_user_username = auth.info.username
        #user.account    = Account.new

        # assuming the user model has an image
        # if auth.info.image
        #   user.image = auth.info.image
        #   user.image = "https://graph.facebook.com/#{auth.uid}/picture?type=large&width=256"
        #   user.remote_avatar_url= "https://graph.facebook.com/#{auth.uid}/picture?type=large&width=256"
        # end



        # user.skip_confirmation!
        user.save!


      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end


    user
  end

end
