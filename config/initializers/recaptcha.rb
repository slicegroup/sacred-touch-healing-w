Recaptcha.configure do |config|
  config.site_key   = '6LffEZIUAAAAAAJL9ZaPdCDPBGErMYrVomGHdPUR'
  config.secret_key = '6LffEZIUAAAAAFniMcsduvZ3P6LZLa5hsnmkCMCL'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end

# Recaptcha.configure do |config|
# 	config.site_key = Rails.application.secrets.site_key
# 	config.secret_key = Rails.application.secrets.secret_key
# end