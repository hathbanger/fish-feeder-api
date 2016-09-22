Warden::Manager.after_authentication do |user,auth,opts|
  puts "this workd"
end