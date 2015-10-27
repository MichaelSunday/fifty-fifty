require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "2df88de580bd423fb156d1c90b700b0d", "0b3f6d37ec504d70b0179a87b05bb9a1", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end