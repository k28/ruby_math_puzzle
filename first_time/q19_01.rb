#! ruby -Ku

#
# a x a, a x b, b x c, c x d, d x e, e x f, f x f
# を満たす数字の組みを求める
#

require 'prime'

primes = Prime.take(6)        #  a〜fに当てはまる素数6個
min = primes[-1] * primes[-1] # 最大でも一番大きい物の平方
min_friend = []

primes.permutation{|prime|
  # 2つずつ並んで掛け算する
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 先頭と末尾は同じ数の平方
  friends += [prime[0], prime[-1]].map{|x| x * x}

  # 最小を更新した場合
  if min > friends.max
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend

