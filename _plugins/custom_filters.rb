module Jekyll
  module CustomTagFilter
    def phone_number(phone)
      phone = phone.to_s
      "#{phone[1, 3]}-#{phone[4, 3]}-#{phone[7, 4]}"
    end

    def liquify(input)
      Liquid::Template.parse(input.to_s).render(@context)
    end

    def hash_concat(hash_1, hash_2)
      merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
      hash_1.merge(hash_2.to_h, &merger)
    end

    def money_without_trailing_zeros(input)
      "$#{input.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse}"
    end

    def money(input)
      "$#{sprintf("%.2f", input.to_f)}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomTagFilter)