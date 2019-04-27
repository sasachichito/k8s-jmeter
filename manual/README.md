# 手動でデプロイ&実行
## 事前準備
1. `envsubst`コマンドインストール
```
# Mac（2019/4時点）
$ brew link --force gettext
```
  
2. git clone
```
$ git clone https://github.com/sasachichito/k8s-jmeter.git
```
  
3. k8s-jmeter/manual/performance-test-scenario.jmxを作成
  
4. k8s-jmeter/manual/slave_totalに合計slave数を記載

## デプロイ&テスト実行
```
$ cd ./k8s-jmeter/manual/
$ ./deploy.sh
```

## レポート

## 環境破棄
```
$ cd ./k8s-jmeter/manual/
$ ./delete.sh
```
