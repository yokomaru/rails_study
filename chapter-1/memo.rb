## 1-1
### 万物がオブジェクト
# irb(main):004:0> "鈴木".object_id
# => 70363946161920
# irb(main):001:0> 1.object_id
# => 3
# irb(main):005:0> "鈴木".object_id
# => 70363946156320
# irb(main):006:0> 1.object_id
# => 3

class Cat
  def catch_mouse(mouse_name)
    puts "#{mouse_name}を追いかけろ〜〜"
  end
end

tama = Cat.new

class CountStringLength
  def count_string_length(string)
    puts "#{string.length}だよ"
  end
end

a = CountStringLength.new
a.count_string_length("edddddddjfablginajgndljfbnaldifnaudbkahsbfaljfblajbalgjsrlgkmdf,mksfaldjfnsaf")

class User
  attr_reader :name, :address, :email
  def initialize(name, address, email)
    @name = name
    @address = address
    @email = email
  end
end

class Person
  def initialize(money)
    @money = money
  end

  def billionaire?
    money >= 10000000000
  end

  private
  def money
    @money
  end
end

Person.new(100000000000)

def name(full: true, with_age: true)
  n = if full
    "#{given_name}#{familly_name}"
  else
    given_name
  end
  n << "(#{age})" if with_age
end

# 「価格のあるもの」を抽象化したクラス
class PricedObject
  def total_price
    price * Tax.rate
  end
  # 「raise NotImplementError」は機能が実装されていないことを表すエラーを発生させるコードです
  def price
    raise NotImplementError
  end
end

class Product < PricedObject
  attr_accessor :price
end

class OrderedItem < PricedObject
  attr_accessor :unit_price, :volume
  # 税抜き価格 * 数量
  def price
    unit_price * volume
  end
end

class Book
  def title
    '本のタイトル'
  end
end

class Magazine < Book
  def title
    '雑誌のタイトル'
  end
end

class BaseTask
  def puts_message
    puts 'BaseTaskのタイトル'
  end
end

class Task < BaseTask
  def puts_message
    super
    puts 'Taskのタイトル'
  end
end

# おしゃべり能力
module Chatting
  def chat
    "hello"
  end
end

class Dog
  include Chatting
end

# irb(main):178:0> pochi = Dog.new
# => #<Dog:0x00007ffdc4069ba8>
# irb(main):179:0> pochi.chat
# => "hello"


module Weeping
  def weep
    "しくしく"
  end
end

class Human
  include Chatting
  include Weeping
end

taro = Human.new
taro.chat
taro.weep

# irb(main):190:0> taro = Human.new
# => #<Human:0x00007ffdc11a4430>
# irb(main):191:0> taro.chat
# => "hello"
# irb(main):192:0> taro.weep
# => "しくしく"

# 価格についての共通期間をまとめたモジュール
module PriceHolder
  def total_price
    price * Tax.rate
  end
end

class Product
  include PriceHolder

  attr_accessor :price
end

class OrderProduct
  include PriceHolder

  attr_accessor :unit_price, :volume
  # 税抜き単価 * 数量
  def price
    :unit_price * volume
  end
end

class Tax
  def self.rate
    1.08
  end
end

class NoMoneyError < StandardError; end
raise NoMoneyError, "no money"

begin
rescue
ensure
end

def メソッド名
rescue
  # 例外
ensure
  # 例外が発生してもしなくても
end

begin
  do_something
rescue SomeSpecialError => e
  puts "#{e.class} (#{e.message})が発生しました。処理を続行します。"
end

def children
  @children ||= []
end
# irb(main):224:0> def children
# irb(main):225:1>   @children ||= []
# irb(main):226:1> end
# => :children
# irb(main):227:0> children
# => []

class User
  def name
    '名前'
  end
end

user = User.new
user.name

object = nil
object.name
object&.name
ary2 = %w(apple banana orange)
ary2 = %i(apple banana orange)
# irb(main):014:0> ary2 = %i(apple banana orange)
# => [:apple, :banana, :orange]

class User
  attr_accessor :name
end

user1 = User.new
user1.name = "ssss"
user2 = User.new
user2.name = "iiii"
user3 = User.new
user3.name = "wwww"

# irb(main):012:0> user1 = User.new
# => #<User:0x00007fc2d90733e0>
# irb(main):013:0> user1.name = "ssss"
# => "ssss"
# irb(main):014:0> user2 = User.new
# => #<User:0x00007fc2d90682d8>
# irb(main):015:0> user2.name = "iiii"
# => "iiii"
# irb(main):016:0> user3 = User.new
# => #<User:0x00007fc2d9081508>
# irb(main):017:0> user3.name = "wwww"
# => "wwww"

users = [user1, user2, user3]
names = []

users.each do |user|
  names << user.name
end

p names
# irb(main):027:0> names = []
# => []
# irb(main):028:0>
# irb(main):029:0> users.each do |user|
# irb(main):030:1*   names << user.name
# irb(main):031:1> end
# => [#<User:0x00007fc2d90733e0 @name="ssss">, #<User:0x00007fc2d90682d8 @name="iiii">, #<User:0x00007fc2d9081508 @name="wwww">]
# irb(main):032:0>
# irb(main):033:0> p names
# ["ssss", "iiii", "wwww"]
# => ["ssss", "iiii", "wwww"]

#mapは新しい配列を返します
names = users.map do |user|
  user.name
end
#["ssss", "iiii", "wwww"]

#mapは新しい配列を返します
names = users.map {|user| user.name}
# irb(main):038:0> names = users.map {|user| user.name}
# => ["ssss", "iiii", "wwww"]
#mapは新しい配列を返します
names = users.map(&:name)
# irb(main):048:0> names = users.map(&:name)
# => ["ssss", "iiii", "wwww"]

