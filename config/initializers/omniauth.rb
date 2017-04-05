OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, 
	'303315864441-lscf9bu9204jqrudqillrgvbeq9f08su.apps.googleusercontent.com', 
	'DhF7WXCKILNGPBXAxAwXVmOc', 
	{
		client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
		hd: 'wesleyan.edu',
  		skip_jwt: true	
	}
end