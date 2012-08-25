#/bin/sh

if [[ "$WEB_DRIVER" = "chrome" ]]; then
  curl -L https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo -s 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list'
  sudo apt-get update
  sudo apt-get -y install google-chrome-unstable unzip
  # curl -k http://chromium.googlecode.com/files/chromedriver_linux32_14.0.836.0.zip | sudo -s 'funzip > /usr/bin/chromedriver'
  sudo -s 'curl -L http://chromium.googlecode.com/files/chromedriver_linux32_17.0.963.0.zip > /usr/bin/chromedriver'
  sudo chmod +x /usr/bin/chromedriver
fi

sh -e /etc/init.d/xvfb start
