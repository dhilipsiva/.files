# https://stackoverflow.com/a/55339334
echo insecure >> ~/.curlrc
git config --global http.sslVerify false
HOMEBREW_CURLRC=1 brew reinstall openssl curl
sed -i '/^insecure$/d' ~/.curlrc
git config --global http.sslVerify true
