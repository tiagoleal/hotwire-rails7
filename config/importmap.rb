# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
# pin "@rails/activestorage", to: "activestorage.esm.js"

# Use node modules from a JavaScript CDN by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/stimulus-importmap-autoloader", to: "stimulus-importmap-autoloader.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin_all_from "app/javascript/components", under: "comps"

pin "md5", to: "https://cdn.skypack.dev/md5"
pin "react", to: "https://ga.jspm.io/npm:react@17.0.2/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@17.0.2/index.js"