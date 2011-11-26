Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '2cwK8b9a2AIehjMcD4ciA', 'QuCfD3BLzpp11TPdeWUjKHz4pS0dAd6vyvSK1oz1sw'
  provider :github, '036298aa34e18a705baf', 'ac2c780c33fee2a0f7eb21fbd7903497a6ee94d0'
end