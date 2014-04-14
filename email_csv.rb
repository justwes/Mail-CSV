
require 'mailgun'
require 'csv'

CSV.open("my_results.csv", "wb") do |csv|
  csv << ["xxx1", "xxx2", "xxx3"]
  csv << ["zzz1", "zzz2", "zzz3"]
end

my_file = File.open("my_results.csv")
    
# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'xxxxxxxxxx'
  config.domain  = 'sandbox68648.mailgun.org'
end

@mailgun = Mailgun()

# or alternatively:
@mailgun = Mailgun(:api_key => 'xxxxxxxxxx')

parameters = {
  :to => "email@email.xyz",
  :subject => "missing tps reports",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "lumberg.bill@initech.mailgun.domain",
  :attachment => my_file
}
@mailgun.messages.send_email(parameters)
