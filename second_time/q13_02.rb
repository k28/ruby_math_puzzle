#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#
# 汎用バージョン
#

expression = "read + talk + write = skill"
words = expression.gsub(/[^a-z]/, '').split('').uniq.join('')

words_len = words.length
(0..9).to_a.permutation do |list|
  replace = list.join('')
  exstr = expression.tr(words, replace)
  # 先頭が0から始まるパターンを除去する
  next if ' ' + exstr =~ / 0[1-9]/
  # pp exstr
  # 式の右と左に分けます
  exps = exstr.split('=')
  left = exps[0]
  right = exps[1]

  calc_left = eval(left)
  if calc_left == right.to_i
    pp exstr
  end
end

