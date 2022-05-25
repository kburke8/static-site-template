Jekyll::Hooks.register(:site, :post_write) do |_site|
    # Temp file to store options. Command line would not accept a series of
    # whitelist classes, and there are a few classes purgecss is missing.
    config_file = 'purgecss.config.js'
   
    # Write configuration file.
    # File.open(config_file, 'w+') { |f| f.write(config_text) }
    # Run purgecss command.
    # system("purgecss --config #{config_file} --output _site/assets")
    #/github/workspace/_plugins/hooks  
    File.chmod(0777,"./node_modules/.bin/purgecss")
    system("./node_modules/.bin/purgecss --css _site/assets/css/*.css --content _site/**/*.html --safelist bg-light --output _site/assets/css/purged")
    #system("/github/workspace/node_modules/.bin/purgecss --css _site/assets/css/bootstrap.min.css --content _site/**/*.html --safelist bg-light --output _site/assets/css")
  end