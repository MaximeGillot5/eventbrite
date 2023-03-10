class ParticipationMailer < ApplicationMailer


    def creation_email(event)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = event.user 
    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'http://monsite.fr/login' 
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @user.email, subject: 'Nouvelle participation!')
    end
end
