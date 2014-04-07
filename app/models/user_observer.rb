class UserObserver < ActiveRecord::Observer 
  def after_create(user)
    @user=user
    UserMailer.welcome_email(@user).deliver
  end  
end