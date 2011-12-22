Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '185155891568059', 'dc7e592fdf81de66f90274d4624c18ff'
end
