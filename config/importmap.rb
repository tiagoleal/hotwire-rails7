# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
# pin "@rails/activestorage", to: "activestorage.esm.js"

# Use node modules from a JavaScript CDN by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/stimulus-importmap-autoloader", to: "stimulus-importmap-autoloader.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "md5", to: "https://cdn.skypack.dev/md5"
pin "htm", to: "https://cdn.esm.sh/v45/htm@3.1.0/es2021/htm.js"
pin "react", to: "https://cdn.esm.sh/v45/react@17.0.2/es2021/index.js"
pin "react-dom", to: "https://cdn.esm.sh/v45/react-dom@17.0.2/es2021/react-dom.js"
pin_all_from "app/javascript/components", under: "components"