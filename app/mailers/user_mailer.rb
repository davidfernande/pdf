#encoding: utf-8
class UserMailer < ActionMailer::Base
    default from: "cercadeti@yelouluz.com"
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Bienvenido a Yelou!luz')
    end
    def thanks_email(user,contrato)
      @user = user
      @contrato=contrato
      mail(to: @user.email, subject: '¡Felicidades!, tu hogar será uno de los primeros en conectarse al sol')
    end    
  
end
