class Emailer < ActionMailer::Base
	default :from => "noreply@moerse.tk"
	default_url_options[:host] = "http://emw.fh-potsdam.de"
  
	def sendProposedBargain(recipient, sender, bargain, sendingUserProduct, receivingUserProduct, sent_at = Time.now)
		@sent_on = sent_at
		@sendingUserProduct = sendingUserProduct
		@receivingUserProduct = receivingUserProduct
		@sendingUser = sender
		@receivingUser = recipient
		@bargain = bargain
		mail(:to => recipient.email, :subject => "Neuer Tauschvorschlag in der Mörse")
	end
  
	def reproposeBargain(recipient, sender, sendingUserProduct, receivingUserProduct, sent_at = Time.now)
		@sent_on = sent_at
		@sendingUserProduct = sendingUserProduct
		@receivingUserProduct = receivingUserProduct
		@sendingUser = sender
		@receivingUser = recipient
		mail(:to => recipient.email, :subject => "Gegenvorschlag für deinen Tausch in der Mörse")
	end
  
	def acceptBargain(recipient, sender, sendingUserProduct, receivingUserProduct, sent_at = Time.now)
		@sent_on = sent_at
		@sendingUserProduct = sendingUserProduct
		@receivingUserProduct = receivingUserProduct
		@sendingUser = sender
		@receivingUser = recipient
		mail(:to => recipient.email, :subject => "Tausch in der Mörse akzeptiert")
		
	end
	
	def acceptBargainToAcceptant(recipient, sender, sendingUserProduct, receivingUserProduct, sent_at = Time.now)
		@sent_on = sent_at
		@sendingUserProduct = sendingUserProduct
		@receivingUserProduct = receivingUserProduct
		@sendingUser = sender
		@receivingUser = recipient
		mail(:to => recipient.email, :subject => "Tausch in der Mörse akzeptiert")
	end
  
	def denyBargain(recipient, sender, sendingUserProduct, receivingUserProduct, sent_at = Time.now)
		@sent_on = sent_at
		@sendingUserProduct = sendingUserProduct
		@receivingUserProduct = receivingUserProduct
		@sendingUser = sender
		@receivingUser = recipient
		mail(:to => recipient.email, :subject => "Tasch in der Mörse abgelehnt")
	end
   
	def sendPassword(recipient, subject, newPw, sent_at = Time.now)
		@loginName = recipient
		@sent_on = sent_at
		@newPw = newPw
		mail(:to => recipient, :subject => subject)
	end
   
	def sendWelcome(recipient)
		@receivingUser = recipient.name
		mail(:to => recipient.email, :subject => "Willkommen in der moerse!")
	end
end
