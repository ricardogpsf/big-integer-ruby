class BigInteger
    attr_reader :num_array

    def initialize(num)
        str_num = num.to_s
        raise "invalid number" unless str_num.match(/^[0-9]*$/)
        @num = str_num
        @num_array = str_num.split("")
    end

    def +(other_bignum)
        other_chars = other_bignum.num_array
        
        if @num_array.length >= other_chars.length
            apply_sum(@num_array, other_chars)
        else
            apply_sum(other_chars, @num_array)
        end
    end

    def apply_sum(greater_num_arr, smaller_num_arr)
        greater_num_arr = greater_num_arr.reverse
        smaller_num_arr = smaller_num_arr.reverse

        i = 0
        result = ""
        carry_over = 0
        for i in 0..(greater_num_arr.length - 1) do
            sum_val = smaller_num_arr[i].to_i + greater_num_arr[i].to_i + carry_over.to_i
            if sum_val >= 10
                new_val = sum_val % 10
                carry_over = 1
                result += new_val.to_s
            else
                carry_over = 0
                result += sum_val.to_s
            end
        end

        result += "1" if carry_over == 1
        BigInteger.new(result.reverse)
    end

    def length
        @num.length
    end

    def to_s
        @num
    end
end

class PrintResult
    def print_line(value, space_value)
        puts value.to_s.rjust(space_value + 1)
    end

    def print_result(space_value, *args)
        args.each do |value|
            print_line(value, space_value)
        end
    end
end


puts BigInteger.new("9999999") + BigInteger.new("111111")
        
