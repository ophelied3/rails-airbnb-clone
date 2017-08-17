class HorseMailer < ApplicationMailer
  def creation_confirmation(horse)
    @horse = horse

    mail(
      to:       @horse.user.email,
      subject:  "Vous avez créé le cheval : #{@horse.name} !"
    )
  end
end
