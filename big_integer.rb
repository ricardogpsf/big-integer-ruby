{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs36 \cf0 \cb2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec3 class BigInteger\
  attr_reader :num_array\
\
  def initialize(num)\
    raise "invalid number" unless num.match(/^[0-9]*$/)\
    @num = num\
    @num_array = num.split("")\
  end\
\
  def print_line(value)\
    puts value.to_s.rjust(self.length + 1)\
  end\
  \
  def print_result(first, second)    \
    print_line(first)\
    print_line(second)\
    print_line("-" * self.length)\
    print_line(self.to_s)\
  end\
\
  def sum(other_bignum)\
    other_chars = other_bignum.num_array\
    \
    if @num_array.length >= other_chars.length\
      apply_sum(@num_array, other_chars)\
    else\
      apply_sum(other_chars, @num_array)\
    end\
  end\
\
  def apply_sum(greater_num_arr, smaller_num_arr)\
    greater_num_arr = greater_num_arr.reverse\
    smaller_num_arr = smaller_num_arr.reverse\
\
    i = 0\
    result = ""\
    carry_over = 0\
    for i in 0..(greater_num_arr.length - 1) do\
      sum_val = smaller_num_arr[i].to_i + greater_num_arr[i].to_i + carry_over.to_i\
      if sum_val >= 10\
        new_val = sum_val % 10\
        carry_over = 1\
        result += new_val.to_s\
      else\
        carry_over = 0\
        result += sum_val.to_s\
      end\
    end\
\
    result += "1" if carry_over == 1\
    BigInteger.new(result.reverse)\
  end\
\
  def length\
    @num.length\
  end\
\
  def to_s\
    @num\
  end\
end\
\
\
\
first = BigInteger.new("99999999999999999999999")\
second = BigInteger.new("8888888888888888888")\
\
res = first.sum(second)\
res.print_result(first, second)\
     \
     \
\
\
}