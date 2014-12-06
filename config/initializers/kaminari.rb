### to remove conflict of will_paginate with active admin
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end