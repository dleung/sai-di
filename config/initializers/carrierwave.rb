CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGTWP2JXUYXQIDDTB7',
    :google_storage_secret_access_key => 'y7qq9dIlvVdCNI166+QU/DWCoOfTQNQSmyXoVZcU'
  }
  config.fog_directory = 'sai_di'
end