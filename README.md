# techgym_rails_course09  
  
## ターミナルに打ち込むコマンド一覧​  
  
techgym_rails_course09の教材中で使用するコマンドをまとめました。  
教材のコマンドをコピー&ペーストする場合にご活用ください。  
  
### 9 - 0：実行環境を整えよう  
【手順】  
```
$ mkdir techgym_rails
```  
  
```
$ cd techgym_rails
```  
  
```
$ git clone https://github.com/techgymjp/techgym_rails_course09.git
```  
  
```
$ cd techgym_rails_course09
```  
  
```
$ bundle install --path vendor/bundle
```  
  
```
$ sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib -y
```  
  
```
$ sudo service postgresql initdb
```  
  
```
$ bundle install --path vendor/bundle
```  
  
```
$ sudo service postgresql start
```  
  
```
$ bundle exec rake db:setup
```  
  
```
$ sudo -u postgres createuser -s ec2-user
```  
  
```
$ bundle exec rake db:setup
```  
  
```
$ bundle install --path vendor/bundle
```  
  
```
$ bundle exec rake db:setup
```  
  
```
$ git checkout -b lesson1 remotes/origin/lesson1
```  
  
```
$ bundle exec rails server
```  
  
### 9 - 1 ：家具を表示しよう  
【手順】  
```  
$ bundle exec rails generate model product admin_user:references category:references title:string description:text
```  
  
```  
$ bundle exec rails db:migrate
```  
  
```  
$ bundle exec rails generate scaffold_controller admin/product admin_user:references category:references title:string description:text
```  
  
### 9 - 2 ：家具の画像を保存して表示しよう  
【手順】  
```  
$ bundle exec rails active_storage:install
```  
  
```  
$ bundle exec rails db:migrate
```  
  
```  
$ touch config/storage.yml
```  
  
### 9 - 4 ：画像をトリミングしよう  
【手順】  
```  
$ bundle install --path vendor/bundle
```  
  
### 9 - 5 ：高水準なエディターで家具の説明欄を作ろう  
【手順】  
```  
$ bundle install --path vendor/bundle
```  
  
```  
$ touch config/initializers/ckeditor.rb
```  
  
### 9 - 6 ：家具情報を検索できるようにしよう  
【手順】  
```  
$ bundle install --path vendor/bundle
```  
  
### 9 - 7 ：既存の家具の類似品を保存できるようにしよう  
【手順】  
```  
$ bundle exec rails generate migration AddOriginIdToProducts origin_id:bigint
```  
  
```  
$ bundle exec rails db:migrate
```  
  
【実行結果】  
```  
$ bundle exec rails console
```  
  
```  
> origin_product = Product.find(1)
```  
  
```  
> copied_product_1 = origin_product.copied_product.new(admin_user_id: 1, category_id: 1, title: "シンプルな棚 白", description: "複製された家具です。")
```  
  
```  
> copied_product_1.save
```  
  
```  
> copied_product_2 = copied_product_1.copied_product.new(admin_user_id: 1, category_id: 1, title: "シンプルな棚 黒", description: "複製された家具から、さらに複製された家具です。")
```  
  
```  
> copied_product_2.save
```  
  
```  
> copied_product_2.errors.full_messages
```  
  
### 9 - 8 ：類似品の新規作成画面を作ろう  
【手順】  
```  
$ bundle exec rails generate controller admin/products/copied_products
```    
  
### 9 - 10 ：ユーザーが閲覧するページを作成しよう  
【手順】  
```
$ mv reference_files/lesson10_pages/*.html app/views/products/
```  
  
```
$ rm app/views/products/index.html.erb app/views/products/show.html.erb
```