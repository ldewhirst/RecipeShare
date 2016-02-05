CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:             'AWS',
    aws_access_key_id:     ENV['AWS_ID'],
    aws_secret_access_key: ENV['AWS_SECRET'],
    region:                'us-east-1',
  }
  config.fog_directory = '/public/images/fog'
  config.fog_public    = false
end
