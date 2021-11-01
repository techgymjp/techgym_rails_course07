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
  
```  
resources :products
```  
  
### 9 - 2 ：家具の画像を保存して表示しよう  
【手順】  
```  
$ sudo yum -y install ImageMagick ImageMagick-deve
```  
  
```  
$ bundle exec rails active_storage:install
```  
  
```  
$ bundle exec rails db:migrate
```  
  
```  
$ touch config/storage.yml
```  
  
```  
local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

```  
  
```  
config.active_storage.service = :local
```  
  
### 9 - 4 ：画像をトリミングしよう  
【手順】  
```  
gem 'image_processing', '~> 1.2'
```  
  
```  
$ bundle install --path vendor/bundle
```  
  
### 9 - 5 ：リッチテキストエディタを導入しよう  
【手順】  
```  
gem 'ckeditor', '~> 5.1'
```  
  
```  
$ bundle install --path vendor/bundle
```  
  
```  
$ touch config/initializers/ckeditor.rb
```  
  
```  
Ckeditor.setup do |config|
  config.cdn_url = "//cdn.ckeditor.com/4.6.1/standard/ckeditor.js"
end
```  
  
```  
<%= javascript_include_tag Ckeditor.cdn_url %>
```  
  
```  
<%= f.cktext_area :description, class: "form-control", ckeditor: { language: "ja" } %>
```  
  
```  
<%== @product.description %>
```  
  
### 9 - 6 ：家具情報を検索できるようにしよう  
【手順】  
```  
gem 'ransack', '~> 2.4', '>= 2.4.2'
```  
  
```  
$ bundle install --path vendor/bundle
```  
  
### 9 - 7 ：家具を複製できるようにしよう  
【手順】  
```  
$ bundle exec rails generate migration AddOriginIdToProducts origin_id:bigint
```  
  
```  
add_foreign_key :products, :products, column: :origin_id
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
  
### 9 - 8 ：家具の複製ページを作ろう  
【手順】  
```  
$ bundle exec rails generate controller admin/products/copied_products
```    
  
### 9 - 10 ：ユーザーが閲覧するページを作成しよう  
【手順】  

```
$ bundle exec rails generate controller products
```  
  
```
root 'products#index'

resources :products, only: [:index, :show]
```  
  
```
$ mv reference_files/lesson10_pages/*.html app/views/products/
```  
  
```
$ rm app/views/products/index.html.erb app/views/products/show.html.erb
```
  
### 9 - 11 ：レビューを投稿できるようにしよう  
【手順】  
```
$ bundle exec rails generate model evaluation product:references rate:integer title:string body:text
```  
  
```
$ bundle exec rails db:migrate
```  
  
```
$ bundle exec rails generate controller admin/evaluations
```  
  
```
$ bundle exec rails generate controller evaluations
```  
  
```
$ rm -r app/views/admin/evaluations
```  
  
```
$ rm -r app/views/evaluations
```  
  