class Admin::NewsletterUsersController < ApplicationController

  def create
    @newsletter_user = Admin::NewsletterUser.create(newsletter_user_params)
  end


  private

  def newsletter_user_params
    params.require(:newsletter_user).permit( :email, :subject)
  end

end
