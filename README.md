## ローカルrubyを扱う場合
```
bundle config --local build.mysql2 --with-ldflags=-L/opt/homebrew/lib --with-opt-dir=/opt/homebrew/opt/openssl
```

必要であれば実行
```
brew install zstd
```